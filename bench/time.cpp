#include <iostream>
#include <fstream>
#include <chrono>
#include <random>
#include <filesystem>
#include <thread>

#include "../src/bufferpool.hpp"
#include "dbutils.h"
#include "benchmarksCreate.h"

using namespace std;
using namespace std::chrono;



int main(){
    std::cout<<"Start benchmark"<<std::endl;
    std::ofstream outFile("benchmark.txt");

    if (!outFile) {
        std::cerr << "Error opening file for writing." << std::endl;
        return 1;
    }
    std::cout<<"Outfile created"<<std::endl;
    auto bmData=benchmarkAllocatePage();
    std::cout<<"Benchmark run"<<std::endl;
    outFile<<"AllocatePage:";
    if (bmData!=nullptr){
        for(benchmark_result res:(*bmData)){
            if(res.data!=nullptr){
                outFile<<res.data<<":";
            }
            outFile<<res.value<<",";
        }
        outFile<<std::endl;
    }else{
        outFile<<"error during benchmark";
    }
    std::cout<<"Benchmark written"<<std::endl;
    // Close the file
    outFile.close();

    std::cout << "Benchmark run successfully." << std::endl;
    return 0;
}