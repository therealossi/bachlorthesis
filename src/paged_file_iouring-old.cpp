// namespace unistd{
//     #include <unistd.h>
// }
// #include <iostream>         
// #include <filesystem>
// #include <cstring>
// #include <cassert>
// #include <liburing.h>
// #include "defs.hpp"
// #include "exceptions.hpp"
// #include "paged_file.hpp"

// static int infd, outfd;  //global file descriptors
// static io_uring* ring;
// static unsigned inflight;
// #define QueueDepth 64
// #define BlockSize (16 * 1024)

// static int setup_context(unsigned entries, struct io_uring *ring) {
//     int ret;

//     ret = io_uring_queue_init(entries, ring, 0);
//     if( ret < 0) {
//         fprintf(stderr, "queue_init: %s\n", strerror(-ret));
//         return -1;
//     }

//     return 0;
// }

// // static void queue_prepped_read(struct io_uring *ring, struct io_data *data) {
// //     struct io_uring_sqe *sqe;

// //     sqe = io_uring_get_sqe(ring);
// //     assert(sqe);

// //     io_uring_prep_readv(sqe, infd, &data->iov, 1, data->offset);

// //     io_uring_sqe_set_data(sqe, data);
// // }

// // static void queue_prepped_write(struct io_uring *ring, struct io_data *data) {
// //     struct io_uring_sqe *sqe;

// //     sqe = io_uring_get_sqe(ring);
// struct io_data {
//     unistd::size_t offset;
//     int index;
//     struct iovec iov;
// };
// /*struct io_data {
//     size_t offset;
//     int index;
//     struct iovec iov;
// };*/
// // }

// static int queue_read(struct io_uring *ring, unistd::off_t offset,unistd::off_t size,int file) {
//     struct io_uring_sqe *sqe;
//     struct io_data *data;
//     void *ptr;

//     ptr = malloc(size + sizeof(*data));
//     // data = ptr + offset;
//     data = static_cast<io_data*>(ptr) + size;
//     data->index = 0;
//     data->offset = offset;
//     data->iov.iov_base = ptr;
//     data->iov.iov_len = size;

//     inflight+=1;

//     struct io_uring_sqe* sqe;
//     sqe=io_uring_get_sqe(ring);
    
//     io_uring_prep_readv(sqe, file, &data->iov, 1, offset);
//     io_uring_sqe_set_data(sqe,data);
//     // sqe flag must be set
    
// }

// static void queue_write(struct io_uring *ring, struct io_data *data) {
    
// }

// static void queue_seekp(struct io_uring *ring, struct io_data *data) {
    
// }

// static void read_iouring(char* returnChar, unistd::off_t remainingLength, int file){
//     //while not all read
//     unistd::off_t offset=0;
//     unistd::size_t readSize;
//     int depth;
//     struct io_uring_cqe *cqe;   //neu dazu 
//     while (remainingLength)
//     {
//         //while empty sqe or no further jobs
//         while (remainingLength&&inflight<QueueDepth)
//         {
//             readSize=BlockSize;
//             if (remainingLength<readSize)
//             {
//                 readSize=remainingLength;
//             }
            
//             //fill sqe
//             queue_read(ring,offset,file);
//             offset+=readSize;
//             remainingLength-=readSize;
//         }

//         if (remainingLength)
//             depth = QueueDepth;
//         else
//             depth = 1;

//         while (remainingLength&&inflight>=depth)
//         {                                                                           
//             int ret = io_uring_wait_cqe(ring, &cqe);                                    // neu Dazu
//             if (ret < 0) {
//                 fprintf(stderr, "io_uring_wait_cqe error: %s\n", strerror(-ret));
//                 break;
//             }
//         }
//         if (cqe != NULL) {
//             struct io_data *data = static_cast<struct io_data*>(io_uring_cqe_get_data(cqe));
//             if (cqe->res >= 0) {
//                 char *result_str = (char *)data->iov.iov_base;
//                 strcat(returnChar, result_str);
//             } else {
//                 // Handle error if needed
//                 fprintf(stderr, "Error in cqe result: %s\n", strerror(-cqe->res));        // bis hier 
//             }
       
//         }
//     }
// }

//  //while completed
//             //get result from cqe
//             //add to returnChar





// static void write_iouring(char* target, int remainingLength){

// }

// static void  seekp_iouring(char* target, int remainingLength){

// }


// bool paged_file::open(const std::string& path, int file_type) {
//     file_name_ = path;
//     std::filesystem::path path_obj(path);
//     // check if path exists and is of a regular file
//     if (! std::filesystem::exists(path_obj)) {
//         file_=open(path);//file_.open(path, std::fstream::in | std::fstream::out | std::fstream::trunc | std::fstream::binary);        // TODO
//         header_.slots_.reset();
//         memset(header_.payload_, 0, FHEADER_PAYLOAD_SIZE);
//         file_.write((const char *)&header_, sizeof(header_)); //    TODO
//         //spdlog::debug("create new paged_file: {}", path);
//     }
//     else {
//         file_=open(path);//file_.open(path, std::fstream::in | std::fstream::out | std::fstream::binary);
//         //spdlog::debug("open existing paged_file: {}, header size: {}", path, sizeof(header_));

//         // read & check header
//         read_iouring((char *) &header_, sizeof(header_),file_);         //    TODO
//         if (memcmp(header_.fid_, "PSDN", 4) || header_.ftype_ != file_type) {
//             //spdlog::info("invalid file: {}, type={}({})", path, header_.ftype_, file_type);
//             unistd::close(file_);//file_.close();
//             return false;
//         }

//     }
//     if (header_callback_ != nullptr)
//         header_callback_(header_read, header_.payload_);
//     file_.seekp(0, file_.end);          // TODO
//     // npages_ = ((unsigned long)file_.tellp() - sizeof(file_header)) / PF_PAGE_SIZE;
//     //spdlog::debug("file '{}' opened with {} pages", path, npages_);
//     return is_open();
// }

// paged_file::~paged_file() {
//     close();
// }

// void paged_file::set_callback(header_cb cb) { 
//     header_callback_ = cb; 
//     if (cb != nullptr)
//         header_callback_(header_read, header_.payload_);
// }

// void paged_file::close() {
//     if (!is_open()) return;

//     if (header_callback_ != nullptr)
//         header_callback_(header_write, header_.payload_);
//     // sync header
//     file_.seekp(0, file_.beg);                              // TODO
//     file_.write((char *) &header_, sizeof(header_));        // TODO
//     // file_.flush();                                          // TODO
//     // spdlog::debug("file {} closed with {} pages", file_name_, npages_);
//     unistd::close(file_);
// }

// paged_file::page_id paged_file::allocate_page() {
//     uint8_t *buf = new uint8_t[PF_PAGE_SIZE];
//     memset(buf, 0, PF_PAGE_SIZE);

//     // find first 0 bit in slots_
//     paged_file::page_id pid = find_first_slot();

//     if (pid != UNKNOWN) {
//         // reuse a freed page
//         // file_.seekp(0, file_.end);
//         file_.seekp(pid * PF_PAGE_SIZE + sizeof(file_header));      // TODO
//         file_.write((const char *) buf, PF_PAGE_SIZE);              // TODO
//         pid += 1;
//     }
//     else {
//         // append a page to the file
//         file_.seekp(0, file_.end);                      // TODO     
//         file_.write((const char *) buf, PF_PAGE_SIZE);        // TODO   
//         npages_++;
//         // pid = ((unsigned long)file_.tellp() - sizeof(file_header)) / PF_PAGE_SIZE;
//     }
//     // mark slot
//     // std::cout << "allocate --> " << pid << " : " << npages_ << std::endl;
//     assert(pid >= 0 && pid < header_.slots_.size());
//     header_.slots_.set(pid-1, true);
//     delete [] buf;
//     return pid;
// }

// paged_file::page_id paged_file::last_valid_page() {
//     if (npages_ == 0) return allocate_page();
//     auto i = npages_ - 1;
//     while (i >= 0) {
//         if (header_.slots_.test(i)) {
//             return i+1;
//         }
//         if (i == 0) break;
//         i--;
//     }
//     return allocate_page();
// }

// bool paged_file::free_page(paged_file::page_id pid) {
//     if (pid == 0 || (pid-1) > npages_)
//         return false;
//     if (!header_.slots_.test(pid-1))
//         return false;
//     header_.slots_.set(pid-1, false);
//     return true;
// }

// bool paged_file::read_page(paged_file::page_id pid, page& pg) {
//     // check slot & npages_
//     if (pid == 0 || (pid-1) > npages_ || !header_.slots_.test(pid-1)) {
//         //spdlog::info("ERROR in read_page in {}: {}, pages={} -> slot={}", file_name_, pid, npages_, header_.slots_.test(pid-1));
//         throw index_out_of_range();
//     }
//     // std::cout << "read from pos " << (pid-1) * PF_PAGE_SIZE + sizeof(file_header) << std::endl;

//     //spdlog::debug("read page in {}: {}", file_name_, pid);
//     file_.seekg((pid-1) * PF_PAGE_SIZE + sizeof(file_header));          // TODO
//     read_iouring((char *) pg.payload, PF_PAGE_SIZE, file_);                  // TODO

//     return file_.good();
// }

// bool paged_file::write_page(paged_file::page_id pid, page& pg) {
//     // check slot & npages_
//     if (pid == 0 || (pid-1) > npages_ || !header_.slots_.test(pid-1)) {
//         //spdlog::info("ERROR in write_page: {}, {}", pid, npages_);
//         throw index_out_of_range();
//     }
//     //spdlog::debug("write page in {}: {}", file_name_, pid);
//     file_.seekp((pid-1) * PF_PAGE_SIZE + sizeof(file_header));          // TODO
//     file_.write((char *) pg.payload, PF_PAGE_SIZE);                     // TODO

//     return file_.good();
// }

// paged_file::page_id paged_file::find_first_slot() {
//     for (auto i = 0u; i < npages_; i++) {
//         if (!header_.slots_.test(i))
//             return i;
//     }
//     return UNKNOWN;
// }

// void paged_file::scan_pages(page& pg, std::function<void(page&, paged_file::page_id)> cb) {
//     paged_file::page_id pid = 1;
//     file_.seekg(sizeof(file_header));
//     while (!file_.eof()) {
//         read_iouring((char *) pg.payload, PF_PAGE_SIZE, file_);   // TODO
//         if (header_.slots_.test(pid-1))  
//             cb(pg, pid);
//         pid++;
//     }
//     // reset the eof flag, otherwise tellp will fail
//     file_.clear();
// }

// void paged_file::truncate() {
//      header_.slots_.reset();
//     // TODO: truncate file    
// }


 