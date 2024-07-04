# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.5)

file(MAKE_DIRECTORY
  "/home/ossi/Github/bachlorthesis/build/_deps/liburing4cpp-src"
  "/home/ossi/Github/bachlorthesis/build/_deps/liburing4cpp-build"
  "/home/ossi/Github/bachlorthesis/build/_deps/liburing4cpp-subbuild/liburing4cpp-populate-prefix"
  "/home/ossi/Github/bachlorthesis/build/_deps/liburing4cpp-subbuild/liburing4cpp-populate-prefix/tmp"
  "/home/ossi/Github/bachlorthesis/build/_deps/liburing4cpp-subbuild/liburing4cpp-populate-prefix/src/liburing4cpp-populate-stamp"
  "/home/ossi/Github/bachlorthesis/build/_deps/liburing4cpp-subbuild/liburing4cpp-populate-prefix/src"
  "/home/ossi/Github/bachlorthesis/build/_deps/liburing4cpp-subbuild/liburing4cpp-populate-prefix/src/liburing4cpp-populate-stamp"
)

set(configSubDirs )
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "/home/ossi/Github/bachlorthesis/build/_deps/liburing4cpp-subbuild/liburing4cpp-populate-prefix/src/liburing4cpp-populate-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "/home/ossi/Github/bachlorthesis/build/_deps/liburing4cpp-subbuild/liburing4cpp-populate-prefix/src/liburing4cpp-populate-stamp${cfgdir}") # cfgdir has leading slash
endif()
