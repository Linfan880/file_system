# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list

# Suppress display of executed commands.
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
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The program to use to edit the cache.
CMAKE_EDIT_COMMAND = /usr/bin/ccmake

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /tmp/tmp.o3wWnieHFs

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /tmp/tmp.o3wWnieHFs/cmake-build-release

# Include any dependencies generated for this target.
include test/test_string/CMakeFiles/test_string.dir/depend.make

# Include the progress variables for this target.
include test/test_string/CMakeFiles/test_string.dir/progress.make

# Include the compile flags for this target's objects.
include test/test_string/CMakeFiles/test_string.dir/flags.make

test/test_string/CMakeFiles/test_string.dir/main.cpp.o: test/test_string/CMakeFiles/test_string.dir/flags.make
test/test_string/CMakeFiles/test_string.dir/main.cpp.o: ../test/test_string/main.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /tmp/tmp.o3wWnieHFs/cmake-build-release/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object test/test_string/CMakeFiles/test_string.dir/main.cpp.o"
	cd /tmp/tmp.o3wWnieHFs/cmake-build-release/test/test_string && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/test_string.dir/main.cpp.o -c /tmp/tmp.o3wWnieHFs/test/test_string/main.cpp

test/test_string/CMakeFiles/test_string.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/test_string.dir/main.cpp.i"
	cd /tmp/tmp.o3wWnieHFs/cmake-build-release/test/test_string && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /tmp/tmp.o3wWnieHFs/test/test_string/main.cpp > CMakeFiles/test_string.dir/main.cpp.i

test/test_string/CMakeFiles/test_string.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/test_string.dir/main.cpp.s"
	cd /tmp/tmp.o3wWnieHFs/cmake-build-release/test/test_string && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /tmp/tmp.o3wWnieHFs/test/test_string/main.cpp -o CMakeFiles/test_string.dir/main.cpp.s

test/test_string/CMakeFiles/test_string.dir/main.cpp.o.requires:
.PHONY : test/test_string/CMakeFiles/test_string.dir/main.cpp.o.requires

test/test_string/CMakeFiles/test_string.dir/main.cpp.o.provides: test/test_string/CMakeFiles/test_string.dir/main.cpp.o.requires
	$(MAKE) -f test/test_string/CMakeFiles/test_string.dir/build.make test/test_string/CMakeFiles/test_string.dir/main.cpp.o.provides.build
.PHONY : test/test_string/CMakeFiles/test_string.dir/main.cpp.o.provides

test/test_string/CMakeFiles/test_string.dir/main.cpp.o.provides.build: test/test_string/CMakeFiles/test_string.dir/main.cpp.o

test/test_string/CMakeFiles/test_string.dir/String.cpp.o: test/test_string/CMakeFiles/test_string.dir/flags.make
test/test_string/CMakeFiles/test_string.dir/String.cpp.o: ../test/test_string/String.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /tmp/tmp.o3wWnieHFs/cmake-build-release/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object test/test_string/CMakeFiles/test_string.dir/String.cpp.o"
	cd /tmp/tmp.o3wWnieHFs/cmake-build-release/test/test_string && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/test_string.dir/String.cpp.o -c /tmp/tmp.o3wWnieHFs/test/test_string/String.cpp

test/test_string/CMakeFiles/test_string.dir/String.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/test_string.dir/String.cpp.i"
	cd /tmp/tmp.o3wWnieHFs/cmake-build-release/test/test_string && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /tmp/tmp.o3wWnieHFs/test/test_string/String.cpp > CMakeFiles/test_string.dir/String.cpp.i

test/test_string/CMakeFiles/test_string.dir/String.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/test_string.dir/String.cpp.s"
	cd /tmp/tmp.o3wWnieHFs/cmake-build-release/test/test_string && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /tmp/tmp.o3wWnieHFs/test/test_string/String.cpp -o CMakeFiles/test_string.dir/String.cpp.s

test/test_string/CMakeFiles/test_string.dir/String.cpp.o.requires:
.PHONY : test/test_string/CMakeFiles/test_string.dir/String.cpp.o.requires

test/test_string/CMakeFiles/test_string.dir/String.cpp.o.provides: test/test_string/CMakeFiles/test_string.dir/String.cpp.o.requires
	$(MAKE) -f test/test_string/CMakeFiles/test_string.dir/build.make test/test_string/CMakeFiles/test_string.dir/String.cpp.o.provides.build
.PHONY : test/test_string/CMakeFiles/test_string.dir/String.cpp.o.provides

test/test_string/CMakeFiles/test_string.dir/String.cpp.o.provides.build: test/test_string/CMakeFiles/test_string.dir/String.cpp.o

# Object files for target test_string
test_string_OBJECTS = \
"CMakeFiles/test_string.dir/main.cpp.o" \
"CMakeFiles/test_string.dir/String.cpp.o"

# External object files for target test_string
test_string_EXTERNAL_OBJECTS =

bin/test_string: test/test_string/CMakeFiles/test_string.dir/main.cpp.o
bin/test_string: test/test_string/CMakeFiles/test_string.dir/String.cpp.o
bin/test_string: test/test_string/CMakeFiles/test_string.dir/build.make
bin/test_string: test/test_string/CMakeFiles/test_string.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable ../../bin/test_string"
	cd /tmp/tmp.o3wWnieHFs/cmake-build-release/test/test_string && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/test_string.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
test/test_string/CMakeFiles/test_string.dir/build: bin/test_string
.PHONY : test/test_string/CMakeFiles/test_string.dir/build

test/test_string/CMakeFiles/test_string.dir/requires: test/test_string/CMakeFiles/test_string.dir/main.cpp.o.requires
test/test_string/CMakeFiles/test_string.dir/requires: test/test_string/CMakeFiles/test_string.dir/String.cpp.o.requires
.PHONY : test/test_string/CMakeFiles/test_string.dir/requires

test/test_string/CMakeFiles/test_string.dir/clean:
	cd /tmp/tmp.o3wWnieHFs/cmake-build-release/test/test_string && $(CMAKE_COMMAND) -P CMakeFiles/test_string.dir/cmake_clean.cmake
.PHONY : test/test_string/CMakeFiles/test_string.dir/clean

test/test_string/CMakeFiles/test_string.dir/depend:
	cd /tmp/tmp.o3wWnieHFs/cmake-build-release && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /tmp/tmp.o3wWnieHFs /tmp/tmp.o3wWnieHFs/test/test_string /tmp/tmp.o3wWnieHFs/cmake-build-release /tmp/tmp.o3wWnieHFs/cmake-build-release/test/test_string /tmp/tmp.o3wWnieHFs/cmake-build-release/test/test_string/CMakeFiles/test_string.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : test/test_string/CMakeFiles/test_string.dir/depend

