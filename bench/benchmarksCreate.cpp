#include "benchmarksCreate.h"

// list of benchmarks 
// test1 allocate page
std::vector<benchmark_result>* benchmarkAllocatePage(){
    std::vector<benchmark_result>* ret=new std::vector<benchmark_result>();
    create_dir("benchdir");

    std::cout<<"Created outDir"<<std::endl;

    auto bench_file = std::make_shared<paged_file>();

    std::cout<<"Made file"<<std::endl;

    bench_file->open("benchdir/benches.db", 0);

    std::cout<<"Created dbFile"<<std::endl;

    auto start = std::chrono::high_resolution_clock::now();
    auto mid=std::chrono::high_resolution_clock::now();
    const size_t BUFFER_SIZE = 500; // Adjust based on system capabilities
    bufferpool bp(BUFFER_SIZE);
    bp.register_file(0, bench_file);
    for (auto i = 0u; i < 1000; i++)
            bp.allocate_page(0ul);
    
    std::chrono::duration<double> duration = std::chrono::high_resolution_clock::now() - mid;
    ret->push_back(benchmark_result("Allocate",duration.count()));
    mid=std::chrono::high_resolution_clock::now();

    for (auto i = 1u; i <= 1000; i++) {
        auto p = bp.fetch_page(i);
        p->payload[0] = i+1;
        bp.mark_dirty(i);
    }

    duration = std::chrono::high_resolution_clock::now() - mid;
    ret->push_back(benchmark_result("Initialize",duration.count()));
    mid=std::chrono::high_resolution_clock::now();

    bp.flush_all();

    duration = std::chrono::high_resolution_clock::now() - mid;
    ret->push_back(benchmark_result("Flush",duration.count()));


    duration = std::chrono::high_resolution_clock::now() - start;
    ret->push_back(benchmark_result("Total",duration.count()));
    std::cout << "Elapsed time: " << duration.count() << "s" << std::endl;
    
    return ret;
}


// test2 allocate and write all pages
// test3 allocate, write with random input, delete all pages
// test4 delete all pages 
// test5 allocate, write with random input, read all pages
// test5 allocate, write with random input, read all pages, delete all pages
// test6 allocate, write with random input, read all pages, wirte all pages, read all pages
// test7 read all files
// test8 read all files, delete all files
// test9 write all files 
