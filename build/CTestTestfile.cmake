# CMake generated Testfile for 
# Source directory: /home/ossi/Github/poseidon_bufferpool
# Build directory: /home/ossi/Github/poseidon_bufferpool/build
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test([=[bufferpool_test]=] "/home/ossi/Github/poseidon_bufferpool/build/bufferpool_test")
set_tests_properties([=[bufferpool_test]=] PROPERTIES  _BACKTRACE_TRIPLES "/home/ossi/Github/poseidon_bufferpool/CMakeLists.txt;63;add_test;/home/ossi/Github/poseidon_bufferpool/CMakeLists.txt;0;")
add_test([=[paged_file_test]=] "/home/ossi/Github/poseidon_bufferpool/build/paged_file_test")
set_tests_properties([=[paged_file_test]=] PROPERTIES  _BACKTRACE_TRIPLES "/home/ossi/Github/poseidon_bufferpool/CMakeLists.txt;63;add_test;/home/ossi/Github/poseidon_bufferpool/CMakeLists.txt;0;")
subdirs("_deps/liburing4cpp-build")
subdirs("_deps/catch2-build")
