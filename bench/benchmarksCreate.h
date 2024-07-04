#ifndef BENCHMARKS_CREATE
#define BENCHMARKS_CREATE
#include "dbutils.h"
#include <iostream>
#include <chrono>
#include <random>
#include <filesystem>
#include "../src/bufferpool.hpp"

std::vector<benchmark_result>* benchmarkAllocatePage();

#endif