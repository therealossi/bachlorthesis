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
CMAKE_SOURCE_DIR = /home/ossi/Github/poseidon_bufferpool/build/_deps/liburing4cpp-subbuild

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/ossi/Github/poseidon_bufferpool/build/_deps/liburing4cpp-subbuild

# Utility rule file for liburing4cpp-populate.

# Include any custom commands dependencies for this target.
include CMakeFiles/liburing4cpp-populate.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/liburing4cpp-populate.dir/progress.make

CMakeFiles/liburing4cpp-populate: CMakeFiles/liburing4cpp-populate-complete

CMakeFiles/liburing4cpp-populate-complete: liburing4cpp-populate-prefix/src/liburing4cpp-populate-stamp/liburing4cpp-populate-install
CMakeFiles/liburing4cpp-populate-complete: liburing4cpp-populate-prefix/src/liburing4cpp-populate-stamp/liburing4cpp-populate-mkdir
CMakeFiles/liburing4cpp-populate-complete: liburing4cpp-populate-prefix/src/liburing4cpp-populate-stamp/liburing4cpp-populate-download
CMakeFiles/liburing4cpp-populate-complete: liburing4cpp-populate-prefix/src/liburing4cpp-populate-stamp/liburing4cpp-populate-update
CMakeFiles/liburing4cpp-populate-complete: liburing4cpp-populate-prefix/src/liburing4cpp-populate-stamp/liburing4cpp-populate-patch
CMakeFiles/liburing4cpp-populate-complete: liburing4cpp-populate-prefix/src/liburing4cpp-populate-stamp/liburing4cpp-populate-configure
CMakeFiles/liburing4cpp-populate-complete: liburing4cpp-populate-prefix/src/liburing4cpp-populate-stamp/liburing4cpp-populate-build
CMakeFiles/liburing4cpp-populate-complete: liburing4cpp-populate-prefix/src/liburing4cpp-populate-stamp/liburing4cpp-populate-install
CMakeFiles/liburing4cpp-populate-complete: liburing4cpp-populate-prefix/src/liburing4cpp-populate-stamp/liburing4cpp-populate-test
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold --progress-dir=/home/ossi/Github/poseidon_bufferpool/build/_deps/liburing4cpp-subbuild/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Completed 'liburing4cpp-populate'"
	/usr/bin/cmake -E make_directory /home/ossi/Github/poseidon_bufferpool/build/_deps/liburing4cpp-subbuild/CMakeFiles
	/usr/bin/cmake -E touch /home/ossi/Github/poseidon_bufferpool/build/_deps/liburing4cpp-subbuild/CMakeFiles/liburing4cpp-populate-complete
	/usr/bin/cmake -E touch /home/ossi/Github/poseidon_bufferpool/build/_deps/liburing4cpp-subbuild/liburing4cpp-populate-prefix/src/liburing4cpp-populate-stamp/liburing4cpp-populate-done

liburing4cpp-populate-prefix/src/liburing4cpp-populate-stamp/liburing4cpp-populate-update:
.PHONY : liburing4cpp-populate-prefix/src/liburing4cpp-populate-stamp/liburing4cpp-populate-update

liburing4cpp-populate-prefix/src/liburing4cpp-populate-stamp/liburing4cpp-populate-build: liburing4cpp-populate-prefix/src/liburing4cpp-populate-stamp/liburing4cpp-populate-configure
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold --progress-dir=/home/ossi/Github/poseidon_bufferpool/build/_deps/liburing4cpp-subbuild/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "No build step for 'liburing4cpp-populate'"
	cd /home/ossi/Github/poseidon_bufferpool/build/_deps/liburing4cpp-build && /usr/bin/cmake -E echo_append
	cd /home/ossi/Github/poseidon_bufferpool/build/_deps/liburing4cpp-build && /usr/bin/cmake -E touch /home/ossi/Github/poseidon_bufferpool/build/_deps/liburing4cpp-subbuild/liburing4cpp-populate-prefix/src/liburing4cpp-populate-stamp/liburing4cpp-populate-build

liburing4cpp-populate-prefix/src/liburing4cpp-populate-stamp/liburing4cpp-populate-configure: liburing4cpp-populate-prefix/tmp/liburing4cpp-populate-cfgcmd.txt
liburing4cpp-populate-prefix/src/liburing4cpp-populate-stamp/liburing4cpp-populate-configure: liburing4cpp-populate-prefix/src/liburing4cpp-populate-stamp/liburing4cpp-populate-patch
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold --progress-dir=/home/ossi/Github/poseidon_bufferpool/build/_deps/liburing4cpp-subbuild/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "No configure step for 'liburing4cpp-populate'"
	cd /home/ossi/Github/poseidon_bufferpool/build/_deps/liburing4cpp-build && /usr/bin/cmake -E echo_append
	cd /home/ossi/Github/poseidon_bufferpool/build/_deps/liburing4cpp-build && /usr/bin/cmake -E touch /home/ossi/Github/poseidon_bufferpool/build/_deps/liburing4cpp-subbuild/liburing4cpp-populate-prefix/src/liburing4cpp-populate-stamp/liburing4cpp-populate-configure

liburing4cpp-populate-prefix/src/liburing4cpp-populate-stamp/liburing4cpp-populate-download: liburing4cpp-populate-prefix/src/liburing4cpp-populate-stamp/liburing4cpp-populate-gitinfo.txt
liburing4cpp-populate-prefix/src/liburing4cpp-populate-stamp/liburing4cpp-populate-download: liburing4cpp-populate-prefix/src/liburing4cpp-populate-stamp/liburing4cpp-populate-mkdir
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold --progress-dir=/home/ossi/Github/poseidon_bufferpool/build/_deps/liburing4cpp-subbuild/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Performing download step (git clone) for 'liburing4cpp-populate'"
	cd /home/ossi/Github/poseidon_bufferpool/build/_deps && /usr/bin/cmake -P /home/ossi/Github/poseidon_bufferpool/build/_deps/liburing4cpp-subbuild/liburing4cpp-populate-prefix/tmp/liburing4cpp-populate-gitclone.cmake
	cd /home/ossi/Github/poseidon_bufferpool/build/_deps && /usr/bin/cmake -E touch /home/ossi/Github/poseidon_bufferpool/build/_deps/liburing4cpp-subbuild/liburing4cpp-populate-prefix/src/liburing4cpp-populate-stamp/liburing4cpp-populate-download

liburing4cpp-populate-prefix/src/liburing4cpp-populate-stamp/liburing4cpp-populate-install: liburing4cpp-populate-prefix/src/liburing4cpp-populate-stamp/liburing4cpp-populate-build
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold --progress-dir=/home/ossi/Github/poseidon_bufferpool/build/_deps/liburing4cpp-subbuild/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "No install step for 'liburing4cpp-populate'"
	cd /home/ossi/Github/poseidon_bufferpool/build/_deps/liburing4cpp-build && /usr/bin/cmake -E echo_append
	cd /home/ossi/Github/poseidon_bufferpool/build/_deps/liburing4cpp-build && /usr/bin/cmake -E touch /home/ossi/Github/poseidon_bufferpool/build/_deps/liburing4cpp-subbuild/liburing4cpp-populate-prefix/src/liburing4cpp-populate-stamp/liburing4cpp-populate-install

liburing4cpp-populate-prefix/src/liburing4cpp-populate-stamp/liburing4cpp-populate-mkdir:
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold --progress-dir=/home/ossi/Github/poseidon_bufferpool/build/_deps/liburing4cpp-subbuild/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Creating directories for 'liburing4cpp-populate'"
	/usr/bin/cmake -Dcfgdir= -P /home/ossi/Github/poseidon_bufferpool/build/_deps/liburing4cpp-subbuild/liburing4cpp-populate-prefix/tmp/liburing4cpp-populate-mkdirs.cmake
	/usr/bin/cmake -E touch /home/ossi/Github/poseidon_bufferpool/build/_deps/liburing4cpp-subbuild/liburing4cpp-populate-prefix/src/liburing4cpp-populate-stamp/liburing4cpp-populate-mkdir

liburing4cpp-populate-prefix/src/liburing4cpp-populate-stamp/liburing4cpp-populate-patch: liburing4cpp-populate-prefix/src/liburing4cpp-populate-stamp/liburing4cpp-populate-patch-info.txt
liburing4cpp-populate-prefix/src/liburing4cpp-populate-stamp/liburing4cpp-populate-patch: liburing4cpp-populate-prefix/src/liburing4cpp-populate-stamp/liburing4cpp-populate-update
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold --progress-dir=/home/ossi/Github/poseidon_bufferpool/build/_deps/liburing4cpp-subbuild/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "No patch step for 'liburing4cpp-populate'"
	/usr/bin/cmake -E echo_append
	/usr/bin/cmake -E touch /home/ossi/Github/poseidon_bufferpool/build/_deps/liburing4cpp-subbuild/liburing4cpp-populate-prefix/src/liburing4cpp-populate-stamp/liburing4cpp-populate-patch

liburing4cpp-populate-prefix/src/liburing4cpp-populate-stamp/liburing4cpp-populate-update:
.PHONY : liburing4cpp-populate-prefix/src/liburing4cpp-populate-stamp/liburing4cpp-populate-update

liburing4cpp-populate-prefix/src/liburing4cpp-populate-stamp/liburing4cpp-populate-test: liburing4cpp-populate-prefix/src/liburing4cpp-populate-stamp/liburing4cpp-populate-install
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold --progress-dir=/home/ossi/Github/poseidon_bufferpool/build/_deps/liburing4cpp-subbuild/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "No test step for 'liburing4cpp-populate'"
	cd /home/ossi/Github/poseidon_bufferpool/build/_deps/liburing4cpp-build && /usr/bin/cmake -E echo_append
	cd /home/ossi/Github/poseidon_bufferpool/build/_deps/liburing4cpp-build && /usr/bin/cmake -E touch /home/ossi/Github/poseidon_bufferpool/build/_deps/liburing4cpp-subbuild/liburing4cpp-populate-prefix/src/liburing4cpp-populate-stamp/liburing4cpp-populate-test

liburing4cpp-populate-prefix/src/liburing4cpp-populate-stamp/liburing4cpp-populate-update: liburing4cpp-populate-prefix/tmp/liburing4cpp-populate-gitupdate.cmake
liburing4cpp-populate-prefix/src/liburing4cpp-populate-stamp/liburing4cpp-populate-update: liburing4cpp-populate-prefix/src/liburing4cpp-populate-stamp/liburing4cpp-populate-update-info.txt
liburing4cpp-populate-prefix/src/liburing4cpp-populate-stamp/liburing4cpp-populate-update: liburing4cpp-populate-prefix/src/liburing4cpp-populate-stamp/liburing4cpp-populate-download
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold --progress-dir=/home/ossi/Github/poseidon_bufferpool/build/_deps/liburing4cpp-subbuild/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Performing update step for 'liburing4cpp-populate'"
	cd /home/ossi/Github/poseidon_bufferpool/build/_deps/liburing4cpp-src && /usr/bin/cmake -Dcan_fetch=YES -P /home/ossi/Github/poseidon_bufferpool/build/_deps/liburing4cpp-subbuild/liburing4cpp-populate-prefix/tmp/liburing4cpp-populate-gitupdate.cmake

liburing4cpp-populate: CMakeFiles/liburing4cpp-populate
liburing4cpp-populate: CMakeFiles/liburing4cpp-populate-complete
liburing4cpp-populate: liburing4cpp-populate-prefix/src/liburing4cpp-populate-stamp/liburing4cpp-populate-build
liburing4cpp-populate: liburing4cpp-populate-prefix/src/liburing4cpp-populate-stamp/liburing4cpp-populate-configure
liburing4cpp-populate: liburing4cpp-populate-prefix/src/liburing4cpp-populate-stamp/liburing4cpp-populate-download
liburing4cpp-populate: liburing4cpp-populate-prefix/src/liburing4cpp-populate-stamp/liburing4cpp-populate-install
liburing4cpp-populate: liburing4cpp-populate-prefix/src/liburing4cpp-populate-stamp/liburing4cpp-populate-mkdir
liburing4cpp-populate: liburing4cpp-populate-prefix/src/liburing4cpp-populate-stamp/liburing4cpp-populate-patch
liburing4cpp-populate: liburing4cpp-populate-prefix/src/liburing4cpp-populate-stamp/liburing4cpp-populate-test
liburing4cpp-populate: liburing4cpp-populate-prefix/src/liburing4cpp-populate-stamp/liburing4cpp-populate-update
liburing4cpp-populate: CMakeFiles/liburing4cpp-populate.dir/build.make
.PHONY : liburing4cpp-populate

# Rule to build all files generated by this target.
CMakeFiles/liburing4cpp-populate.dir/build: liburing4cpp-populate
.PHONY : CMakeFiles/liburing4cpp-populate.dir/build

CMakeFiles/liburing4cpp-populate.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/liburing4cpp-populate.dir/cmake_clean.cmake
.PHONY : CMakeFiles/liburing4cpp-populate.dir/clean

CMakeFiles/liburing4cpp-populate.dir/depend:
	cd /home/ossi/Github/poseidon_bufferpool/build/_deps/liburing4cpp-subbuild && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ossi/Github/poseidon_bufferpool/build/_deps/liburing4cpp-subbuild /home/ossi/Github/poseidon_bufferpool/build/_deps/liburing4cpp-subbuild /home/ossi/Github/poseidon_bufferpool/build/_deps/liburing4cpp-subbuild /home/ossi/Github/poseidon_bufferpool/build/_deps/liburing4cpp-subbuild /home/ossi/Github/poseidon_bufferpool/build/_deps/liburing4cpp-subbuild/CMakeFiles/liburing4cpp-populate.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : CMakeFiles/liburing4cpp-populate.dir/depend

