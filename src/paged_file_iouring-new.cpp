#include <unistd.h>
#include <fcntl.h>
#include <sys/stat.h>
#include <sys/ioctl.h>
#include <iostream>
#include <filesystem>
#include <cstring>
#include <cassert>
#include <liburing.h>
#include <liburing/io_service.hpp>
#include "defs.hpp"
#include "exceptions.hpp"
#include "paged_file.hpp"
#include <coroutine>
#include <functional>


uio::io_service service;
int taskCounter=0;
std::mutex m;

#define BlockSize (1/6 * 1024)  //File size 
#define MaxTaskQueued 10
#define useAsync


static void checkForRun(uio::task<>& mostRecentTask){
    m.lock();
    taskCounter++;
    if (taskCounter>=MaxTaskQueued)
    {
        service.run(mostRecentTask);
        taskCounter=0;
    }
    m.unlock();
}

static uio::task<> read_iouring(char* returnChar, off_t offset, int file){
    co_await service.read(file,returnChar,BlockSize,offset);
}   

void read_iouring2(char* returnChar, off_t offset, int file){
    uio::task finalTask=read_iouring(returnChar,offset,file);
    #ifndef useAsync
    service.run(finalTask);
    #else
    checkForRun(finalTask);
    #endif
}

static uio::task<> write_iouring(char* data, off_t offset, int file){
    co_await service.write(file,data,BlockSize,offset);
}
void write_iouring2(char* data, off_t offset, int file){
    uio::task finalTask = write_iouring(data,offset,file);
    #ifndef useAsync
    service.run(finalTask);
    #else
    checkForRun(finalTask);
    #endif
}

bool paged_file::open(const std::string& path, int file_type) {
    file_name_ = path;
    std::filesystem::path path_obj(path);
    uio::task finalTask;
    // check if path exists and is of a regular file
    if (! std::filesystem::exists(path_obj)) {
        file_=open(path.c_str(), O_RDWR|O_CREAT);
        header_.ftype_ = file_type;
        header_.slots_.reset();
        memset(header_.payload_, 0, FHEADER_PAYLOAD_SIZE);
        finalTask=write_iouring((char *)&header_, sizeof(header_),file_);
        //spdlog::debug("create new paged_file: {}", path);
    }
    else {
        file_=open(path.c_str(), O_RDWR|O_CREAT);
        //spdlog::debug("open existing paged_file: {}, header size: {}", path, sizeof(header_));

        // read & check header
        read_iouring2((char *) &header_, sizeof(header_),file_);
        read_iouring2((char *) &header_,sizeof(header_), file_);
        if (memcmp(header_.fid_, "PSDN", 4) || header_.ftype_ != file_type) {
            //spdlog::info("invalid file: {}, type={}({})", path, header_.ftype_, file_type);
            close(file_);
            return false;
        }

    }
    if (header_callback_ != nullptr)
        header_callback_(header_read, header_.payload_);
    //file_.seekp(0, file_.end);
    npages_ = (BlockSize - sizeof(file_header)) / PF_PAGE_SIZE;
    //spdlog::debug("file '{}' opened with {} pages", path, npages_);
    return is_open();
}

paged_file::~paged_file() {
    close_file();
}
void paged_file::set_callback(header_cb cb) { 
    header_callback_ = cb; 
    if (cb != nullptr)
        header_callback_(header_read, header_.payload_);
}

void paged_file::close_file() {
    if (!is_open()) return;

    if (header_callback_ != nullptr)
        header_callback_(header_write, header_.payload_);
    // sync header
    //file_.seekp(0, file_.beg);
    write_iouring2((char *) &header_,0 ,file_);
    // file_.flush(); 
    // spdlog::debug("file {} closed with {} pages", file_name_, npages_);
    close(file_);
}

paged_file::page_id paged_file::allocate_page() {
    uint8_t *buf = new uint8_t[PF_PAGE_SIZE];
    memset(buf, 0, PF_PAGE_SIZE);

    // find first 0 bit in slots_
    paged_file::page_id pid = find_first_slot();

    if (pid != UNKNOWN) {
        // reuse a freed page
        // file_.seekp(0, file_.end);
        //file_.seekp(pid * PF_PAGE_SIZE + sizeof(file_header));
        write_iouring2((char *) buf, pid * PF_PAGE_SIZE + sizeof(file_header),file_);
        pid += 1;
    }
    else {
        // append a page to the file
        //file_.seekp(0, file_.end);
        write_iouring2((char *) buf, BlockSize,file_);
        npages_++;
        pid = (lseek(file_,0,SEEK_END) - sizeof(file_header)) / PF_PAGE_SIZE;
    }
    // mark slot
    // std::cout << "allocate --> " << pid << " : " << npages_ << std::endl;
    assert(pid >= 0 && pid < header_.slots_.size());
    header_.slots_.set(pid-1, true);
    delete [] buf;
    return pid;
}

paged_file::page_id paged_file::last_valid_page() {
    if (npages_ == 0) return allocate_page();
    auto i = npages_ - 1;
    while (i >= 0) {
        if (header_.slots_.test(i)) {
            return i+1;
        }
        if (i == 0) break;
        i--;
    }
    return allocate_page();
}

bool paged_file::free_page(paged_file::page_id pid) {
    if (pid == 0 || (pid-1) > npages_)
        return false;
    if (!header_.slots_.test(pid-1))
        return false;
    header_.slots_.set(pid-1, false);
    return true;
}

bool paged_file::read_page(paged_file::page_id pid, page& pg) {
    // check slot & npages_
    if (pid == 0 || (pid-1) > npages_ || !header_.slots_.test(pid-1)) {
        //spdlog::info("ERROR in read_page in {}: {}, pages={} -> slot={}", file_name_, pid, npages_, header_.slots_.test(pid-1));
        throw index_out_of_range();
    }
    // std::cout << "read from pos " << (pid-1) * PF_PAGE_SIZE + sizeof(file_header) << std::endl;

    //spdlog::debug("read page in {}: {}", file_name_, pid);
    //file_.seekg();
    read_iouring2((char *) pg.payload,(pid-1) * PF_PAGE_SIZE + sizeof(file_header) ,file_);     

    return true;
}

bool paged_file::write_page(paged_file::page_id pid, page& pg) {
    // check slot & npages_
    if (pid == 0 || (pid-1) > npages_ || !header_.slots_.test(pid-1)) {
        //spdlog::info("ERROR in write_page: {}, {}", pid, npages_);
        throw index_out_of_range();
    }
    //spdlog::debug("write page in {}: {}", file_name_, pid);
    //file_.seekp((pid-1) * PF_PAGE_SIZE + sizeof(file_header));
    write_iouring2((char *) pg.payload,(pid-1) * PF_PAGE_SIZE + sizeof(file_header) ,file_); 

    return true;
}

paged_file::page_id paged_file::find_first_slot() {
    for (auto i = 0u; i < npages_; i++) {
        if (!header_.slots_.test(i))
            return i;
    }
    return UNKNOWN;
}



void paged_file::scan_pages(page& pg, std::function<void(page&, paged_file::page_id)> cb) {
    paged_file::page_id pid = 1;
    //file_.seekg(sizeof(file_header));
    while (!pid>BlockSize) {
        read_iouring2((char *) pg.payload,sizeof(file_header)+(pid-1)*BlockSize ,file_);   
        if (header_.slots_.test(pid-1))  
            cb(pg, pid);
        pid++;
    }
    // reset the eof flag, otherwise tellp will fail
    // file_.clear();
}

void paged_file::truncate() {
     header_.slots_.reset();
    // TODO: truncate file    
}
d