# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.29

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/ossi/Github/poseidon_bufferpool

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/ossi/Github/poseidon_bufferpool/build

# Include any dependencies generated for this target.
include CMakeFiles/bufferpool_test.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/bufferpool_test.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/bufferpool_test.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/bufferpool_test.dir/flags.make

CMakeFiles/bufferpool_test.dir/test/bufferpool_test.cpp.o: CMakeFiles/bufferpool_test.dir/flags.make
CMakeFiles/bufferpool_test.dir/test/bufferpool_test.cpp.o: /home/ossi/Github/poseidon_bufferpool/test/bufferpool_test.cpp
CMakeFiles/bufferpool_test.dir/test/bufferpool_test.cpp.o: CMakeFiles/bufferpool_test.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/ossi/Github/poseidon_bufferpool/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/bufferpool_test.dir/test/bufferpool_test.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/bufferpool_test.dir/test/bufferpool_test.cpp.o -MF CMakeFiles/bufferpool_test.dir/test/bufferpool_test.cpp.o.d -o CMakeFiles/bufferpool_test.dir/test/bufferpool_test.cpp.o -c /home/ossi/Github/poseidon_bufferpool/test/bufferpool_test.cpp

CMakeFiles/bufferpool_test.dir/test/bufferpool_test.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/bufferpool_test.dir/test/bufferpool_test.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ossi/Github/poseidon_bufferpool/test/bufferpool_test.cpp > CMakeFiles/bufferpool_test.dir/test/bufferpool_test.cpp.i

CMakeFiles/bufferpool_test.dir/test/bufferpool_test.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/bufferpool_test.dir/test/bufferpool_test.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ossi/Github/poseidon_bufferpool/test/bufferpool_test.cpp -o CMakeFiles/bufferpool_test.dir/test/bufferpool_test.cpp.s

# Object files for target bufferpool_test
bufferpool_test_OBJECTS = \
"CMakeFiles/bufferpool_test.dir/test/bufferpool_test.cpp.o"

# External object files for target bufferpool_test
bufferpool_test_EXTERNAL_OBJECTS =

bufferpool_test: CMakeFiles/bufferpool_test.dir/test/bufferpool_test.cpp.o
bufferpool_test: CMakeFiles/bufferpool_test.dir/build.make
bufferpool_test: _deps/catch2-build/src/libCatch2Main.a
bufferpool_test: libbuffermanager.a
bufferpool_test: _deps/catch2-build/src/libCatch2.a
bufferpool_test: CMakeFiles/bufferpool_test.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/home/ossi/Github/poseidon_bufferpool/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable bufferpool_test"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/bufferpool_test.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/bufferpool_test.dir/build: bufferpool_test
.PHONY : CMakeFiles/bufferpool_test.dir/build

CMakeFiles/bufferpool_test.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/bufferpool_test.dir/cmake_clean.cmake
.PHONY : CMakeFiles/bufferpool_test.dir/clean

CMakeFiles/bufferpool_test.dir/depend:
	cd /home/ossi/Github/poseidon_bufferpool/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ossi/Github/poseidon_bufferpool /home/ossi/Github/poseidon_bufferpool /home/ossi/Github/poseidon_bufferpool/build /home/ossi/Github/poseidon_bufferpool/build /home/ossi/Github/poseidon_bufferpool/build/CMakeFiles/bufferpool_test.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : CMakeFiles/bufferpool_test.dir/depend
