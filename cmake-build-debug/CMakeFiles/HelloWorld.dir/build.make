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
CMAKE_BINARY_DIR = /tmp/tmp.o3wWnieHFs/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/HelloWorld.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/HelloWorld.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/HelloWorld.dir/flags.make

CMakeFiles/HelloWorld.dir/HelloWorld/main.cpp.o: CMakeFiles/HelloWorld.dir/flags.make
CMakeFiles/HelloWorld.dir/HelloWorld/main.cpp.o: ../HelloWorld/main.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /tmp/tmp.o3wWnieHFs/cmake-build-debug/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/HelloWorld.dir/HelloWorld/main.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/HelloWorld.dir/HelloWorld/main.cpp.o -c /tmp/tmp.o3wWnieHFs/HelloWorld/main.cpp

CMakeFiles/HelloWorld.dir/HelloWorld/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/HelloWorld.dir/HelloWorld/main.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /tmp/tmp.o3wWnieHFs/HelloWorld/main.cpp > CMakeFiles/HelloWorld.dir/HelloWorld/main.cpp.i

CMakeFiles/HelloWorld.dir/HelloWorld/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/HelloWorld.dir/HelloWorld/main.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /tmp/tmp.o3wWnieHFs/HelloWorld/main.cpp -o CMakeFiles/HelloWorld.dir/HelloWorld/main.cpp.s

CMakeFiles/HelloWorld.dir/HelloWorld/main.cpp.o.requires:
.PHONY : CMakeFiles/HelloWorld.dir/HelloWorld/main.cpp.o.requires

CMakeFiles/HelloWorld.dir/HelloWorld/main.cpp.o.provides: CMakeFiles/HelloWorld.dir/HelloWorld/main.cpp.o.requires
	$(MAKE) -f CMakeFiles/HelloWorld.dir/build.make CMakeFiles/HelloWorld.dir/HelloWorld/main.cpp.o.provides.build
.PHONY : CMakeFiles/HelloWorld.dir/HelloWorld/main.cpp.o.provides

CMakeFiles/HelloWorld.dir/HelloWorld/main.cpp.o.provides.build: CMakeFiles/HelloWorld.dir/HelloWorld/main.cpp.o

CMakeFiles/HelloWorld.dir/HelloWorld/Cat.cpp.o: CMakeFiles/HelloWorld.dir/flags.make
CMakeFiles/HelloWorld.dir/HelloWorld/Cat.cpp.o: ../HelloWorld/Cat.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /tmp/tmp.o3wWnieHFs/cmake-build-debug/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/HelloWorld.dir/HelloWorld/Cat.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/HelloWorld.dir/HelloWorld/Cat.cpp.o -c /tmp/tmp.o3wWnieHFs/HelloWorld/Cat.cpp

CMakeFiles/HelloWorld.dir/HelloWorld/Cat.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/HelloWorld.dir/HelloWorld/Cat.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /tmp/tmp.o3wWnieHFs/HelloWorld/Cat.cpp > CMakeFiles/HelloWorld.dir/HelloWorld/Cat.cpp.i

CMakeFiles/HelloWorld.dir/HelloWorld/Cat.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/HelloWorld.dir/HelloWorld/Cat.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /tmp/tmp.o3wWnieHFs/HelloWorld/Cat.cpp -o CMakeFiles/HelloWorld.dir/HelloWorld/Cat.cpp.s

CMakeFiles/HelloWorld.dir/HelloWorld/Cat.cpp.o.requires:
.PHONY : CMakeFiles/HelloWorld.dir/HelloWorld/Cat.cpp.o.requires

CMakeFiles/HelloWorld.dir/HelloWorld/Cat.cpp.o.provides: CMakeFiles/HelloWorld.dir/HelloWorld/Cat.cpp.o.requires
	$(MAKE) -f CMakeFiles/HelloWorld.dir/build.make CMakeFiles/HelloWorld.dir/HelloWorld/Cat.cpp.o.provides.build
.PHONY : CMakeFiles/HelloWorld.dir/HelloWorld/Cat.cpp.o.provides

CMakeFiles/HelloWorld.dir/HelloWorld/Cat.cpp.o.provides.build: CMakeFiles/HelloWorld.dir/HelloWorld/Cat.cpp.o

CMakeFiles/HelloWorld.dir/HelloWorld/Dog.cpp.o: CMakeFiles/HelloWorld.dir/flags.make
CMakeFiles/HelloWorld.dir/HelloWorld/Dog.cpp.o: ../HelloWorld/Dog.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /tmp/tmp.o3wWnieHFs/cmake-build-debug/CMakeFiles $(CMAKE_PROGRESS_3)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/HelloWorld.dir/HelloWorld/Dog.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/HelloWorld.dir/HelloWorld/Dog.cpp.o -c /tmp/tmp.o3wWnieHFs/HelloWorld/Dog.cpp

CMakeFiles/HelloWorld.dir/HelloWorld/Dog.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/HelloWorld.dir/HelloWorld/Dog.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /tmp/tmp.o3wWnieHFs/HelloWorld/Dog.cpp > CMakeFiles/HelloWorld.dir/HelloWorld/Dog.cpp.i

CMakeFiles/HelloWorld.dir/HelloWorld/Dog.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/HelloWorld.dir/HelloWorld/Dog.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /tmp/tmp.o3wWnieHFs/HelloWorld/Dog.cpp -o CMakeFiles/HelloWorld.dir/HelloWorld/Dog.cpp.s

CMakeFiles/HelloWorld.dir/HelloWorld/Dog.cpp.o.requires:
.PHONY : CMakeFiles/HelloWorld.dir/HelloWorld/Dog.cpp.o.requires

CMakeFiles/HelloWorld.dir/HelloWorld/Dog.cpp.o.provides: CMakeFiles/HelloWorld.dir/HelloWorld/Dog.cpp.o.requires
	$(MAKE) -f CMakeFiles/HelloWorld.dir/build.make CMakeFiles/HelloWorld.dir/HelloWorld/Dog.cpp.o.provides.build
.PHONY : CMakeFiles/HelloWorld.dir/HelloWorld/Dog.cpp.o.provides

CMakeFiles/HelloWorld.dir/HelloWorld/Dog.cpp.o.provides.build: CMakeFiles/HelloWorld.dir/HelloWorld/Dog.cpp.o

CMakeFiles/HelloWorld.dir/HelloWorld/Person.cpp.o: CMakeFiles/HelloWorld.dir/flags.make
CMakeFiles/HelloWorld.dir/HelloWorld/Person.cpp.o: ../HelloWorld/Person.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /tmp/tmp.o3wWnieHFs/cmake-build-debug/CMakeFiles $(CMAKE_PROGRESS_4)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/HelloWorld.dir/HelloWorld/Person.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/HelloWorld.dir/HelloWorld/Person.cpp.o -c /tmp/tmp.o3wWnieHFs/HelloWorld/Person.cpp

CMakeFiles/HelloWorld.dir/HelloWorld/Person.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/HelloWorld.dir/HelloWorld/Person.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /tmp/tmp.o3wWnieHFs/HelloWorld/Person.cpp > CMakeFiles/HelloWorld.dir/HelloWorld/Person.cpp.i

CMakeFiles/HelloWorld.dir/HelloWorld/Person.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/HelloWorld.dir/HelloWorld/Person.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /tmp/tmp.o3wWnieHFs/HelloWorld/Person.cpp -o CMakeFiles/HelloWorld.dir/HelloWorld/Person.cpp.s

CMakeFiles/HelloWorld.dir/HelloWorld/Person.cpp.o.requires:
.PHONY : CMakeFiles/HelloWorld.dir/HelloWorld/Person.cpp.o.requires

CMakeFiles/HelloWorld.dir/HelloWorld/Person.cpp.o.provides: CMakeFiles/HelloWorld.dir/HelloWorld/Person.cpp.o.requires
	$(MAKE) -f CMakeFiles/HelloWorld.dir/build.make CMakeFiles/HelloWorld.dir/HelloWorld/Person.cpp.o.provides.build
.PHONY : CMakeFiles/HelloWorld.dir/HelloWorld/Person.cpp.o.provides

CMakeFiles/HelloWorld.dir/HelloWorld/Person.cpp.o.provides.build: CMakeFiles/HelloWorld.dir/HelloWorld/Person.cpp.o

# Object files for target HelloWorld
HelloWorld_OBJECTS = \
"CMakeFiles/HelloWorld.dir/HelloWorld/main.cpp.o" \
"CMakeFiles/HelloWorld.dir/HelloWorld/Cat.cpp.o" \
"CMakeFiles/HelloWorld.dir/HelloWorld/Dog.cpp.o" \
"CMakeFiles/HelloWorld.dir/HelloWorld/Person.cpp.o"

# External object files for target HelloWorld
HelloWorld_EXTERNAL_OBJECTS =

../bin/HelloWorld: CMakeFiles/HelloWorld.dir/HelloWorld/main.cpp.o
../bin/HelloWorld: CMakeFiles/HelloWorld.dir/HelloWorld/Cat.cpp.o
../bin/HelloWorld: CMakeFiles/HelloWorld.dir/HelloWorld/Dog.cpp.o
../bin/HelloWorld: CMakeFiles/HelloWorld.dir/HelloWorld/Person.cpp.o
../bin/HelloWorld: CMakeFiles/HelloWorld.dir/build.make
../bin/HelloWorld: CMakeFiles/HelloWorld.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable ../bin/HelloWorld"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/HelloWorld.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/HelloWorld.dir/build: ../bin/HelloWorld
.PHONY : CMakeFiles/HelloWorld.dir/build

CMakeFiles/HelloWorld.dir/requires: CMakeFiles/HelloWorld.dir/HelloWorld/main.cpp.o.requires
CMakeFiles/HelloWorld.dir/requires: CMakeFiles/HelloWorld.dir/HelloWorld/Cat.cpp.o.requires
CMakeFiles/HelloWorld.dir/requires: CMakeFiles/HelloWorld.dir/HelloWorld/Dog.cpp.o.requires
CMakeFiles/HelloWorld.dir/requires: CMakeFiles/HelloWorld.dir/HelloWorld/Person.cpp.o.requires
.PHONY : CMakeFiles/HelloWorld.dir/requires

CMakeFiles/HelloWorld.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/HelloWorld.dir/cmake_clean.cmake
.PHONY : CMakeFiles/HelloWorld.dir/clean

CMakeFiles/HelloWorld.dir/depend:
	cd /tmp/tmp.o3wWnieHFs/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /tmp/tmp.o3wWnieHFs /tmp/tmp.o3wWnieHFs /tmp/tmp.o3wWnieHFs/cmake-build-debug /tmp/tmp.o3wWnieHFs/cmake-build-debug /tmp/tmp.o3wWnieHFs/cmake-build-debug/CMakeFiles/HelloWorld.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/HelloWorld.dir/depend

