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
include CMakeFiles/hiredis.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/hiredis.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/hiredis.dir/flags.make

CMakeFiles/hiredis.dir/thirdparty/hiredis/alloc.c.o: CMakeFiles/hiredis.dir/flags.make
CMakeFiles/hiredis.dir/thirdparty/hiredis/alloc.c.o: ../thirdparty/hiredis/alloc.c
	$(CMAKE_COMMAND) -E cmake_progress_report /tmp/tmp.o3wWnieHFs/cmake-build-debug/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object CMakeFiles/hiredis.dir/thirdparty/hiredis/alloc.c.o"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/hiredis.dir/thirdparty/hiredis/alloc.c.o   -c /tmp/tmp.o3wWnieHFs/thirdparty/hiredis/alloc.c

CMakeFiles/hiredis.dir/thirdparty/hiredis/alloc.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/hiredis.dir/thirdparty/hiredis/alloc.c.i"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /tmp/tmp.o3wWnieHFs/thirdparty/hiredis/alloc.c > CMakeFiles/hiredis.dir/thirdparty/hiredis/alloc.c.i

CMakeFiles/hiredis.dir/thirdparty/hiredis/alloc.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/hiredis.dir/thirdparty/hiredis/alloc.c.s"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /tmp/tmp.o3wWnieHFs/thirdparty/hiredis/alloc.c -o CMakeFiles/hiredis.dir/thirdparty/hiredis/alloc.c.s

CMakeFiles/hiredis.dir/thirdparty/hiredis/alloc.c.o.requires:
.PHONY : CMakeFiles/hiredis.dir/thirdparty/hiredis/alloc.c.o.requires

CMakeFiles/hiredis.dir/thirdparty/hiredis/alloc.c.o.provides: CMakeFiles/hiredis.dir/thirdparty/hiredis/alloc.c.o.requires
	$(MAKE) -f CMakeFiles/hiredis.dir/build.make CMakeFiles/hiredis.dir/thirdparty/hiredis/alloc.c.o.provides.build
.PHONY : CMakeFiles/hiredis.dir/thirdparty/hiredis/alloc.c.o.provides

CMakeFiles/hiredis.dir/thirdparty/hiredis/alloc.c.o.provides.build: CMakeFiles/hiredis.dir/thirdparty/hiredis/alloc.c.o

CMakeFiles/hiredis.dir/thirdparty/hiredis/async.c.o: CMakeFiles/hiredis.dir/flags.make
CMakeFiles/hiredis.dir/thirdparty/hiredis/async.c.o: ../thirdparty/hiredis/async.c
	$(CMAKE_COMMAND) -E cmake_progress_report /tmp/tmp.o3wWnieHFs/cmake-build-debug/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object CMakeFiles/hiredis.dir/thirdparty/hiredis/async.c.o"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/hiredis.dir/thirdparty/hiredis/async.c.o   -c /tmp/tmp.o3wWnieHFs/thirdparty/hiredis/async.c

CMakeFiles/hiredis.dir/thirdparty/hiredis/async.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/hiredis.dir/thirdparty/hiredis/async.c.i"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /tmp/tmp.o3wWnieHFs/thirdparty/hiredis/async.c > CMakeFiles/hiredis.dir/thirdparty/hiredis/async.c.i

CMakeFiles/hiredis.dir/thirdparty/hiredis/async.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/hiredis.dir/thirdparty/hiredis/async.c.s"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /tmp/tmp.o3wWnieHFs/thirdparty/hiredis/async.c -o CMakeFiles/hiredis.dir/thirdparty/hiredis/async.c.s

CMakeFiles/hiredis.dir/thirdparty/hiredis/async.c.o.requires:
.PHONY : CMakeFiles/hiredis.dir/thirdparty/hiredis/async.c.o.requires

CMakeFiles/hiredis.dir/thirdparty/hiredis/async.c.o.provides: CMakeFiles/hiredis.dir/thirdparty/hiredis/async.c.o.requires
	$(MAKE) -f CMakeFiles/hiredis.dir/build.make CMakeFiles/hiredis.dir/thirdparty/hiredis/async.c.o.provides.build
.PHONY : CMakeFiles/hiredis.dir/thirdparty/hiredis/async.c.o.provides

CMakeFiles/hiredis.dir/thirdparty/hiredis/async.c.o.provides.build: CMakeFiles/hiredis.dir/thirdparty/hiredis/async.c.o

CMakeFiles/hiredis.dir/thirdparty/hiredis/dict.c.o: CMakeFiles/hiredis.dir/flags.make
CMakeFiles/hiredis.dir/thirdparty/hiredis/dict.c.o: ../thirdparty/hiredis/dict.c
	$(CMAKE_COMMAND) -E cmake_progress_report /tmp/tmp.o3wWnieHFs/cmake-build-debug/CMakeFiles $(CMAKE_PROGRESS_3)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object CMakeFiles/hiredis.dir/thirdparty/hiredis/dict.c.o"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/hiredis.dir/thirdparty/hiredis/dict.c.o   -c /tmp/tmp.o3wWnieHFs/thirdparty/hiredis/dict.c

CMakeFiles/hiredis.dir/thirdparty/hiredis/dict.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/hiredis.dir/thirdparty/hiredis/dict.c.i"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /tmp/tmp.o3wWnieHFs/thirdparty/hiredis/dict.c > CMakeFiles/hiredis.dir/thirdparty/hiredis/dict.c.i

CMakeFiles/hiredis.dir/thirdparty/hiredis/dict.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/hiredis.dir/thirdparty/hiredis/dict.c.s"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /tmp/tmp.o3wWnieHFs/thirdparty/hiredis/dict.c -o CMakeFiles/hiredis.dir/thirdparty/hiredis/dict.c.s

CMakeFiles/hiredis.dir/thirdparty/hiredis/dict.c.o.requires:
.PHONY : CMakeFiles/hiredis.dir/thirdparty/hiredis/dict.c.o.requires

CMakeFiles/hiredis.dir/thirdparty/hiredis/dict.c.o.provides: CMakeFiles/hiredis.dir/thirdparty/hiredis/dict.c.o.requires
	$(MAKE) -f CMakeFiles/hiredis.dir/build.make CMakeFiles/hiredis.dir/thirdparty/hiredis/dict.c.o.provides.build
.PHONY : CMakeFiles/hiredis.dir/thirdparty/hiredis/dict.c.o.provides

CMakeFiles/hiredis.dir/thirdparty/hiredis/dict.c.o.provides.build: CMakeFiles/hiredis.dir/thirdparty/hiredis/dict.c.o

CMakeFiles/hiredis.dir/thirdparty/hiredis/hiredis.c.o: CMakeFiles/hiredis.dir/flags.make
CMakeFiles/hiredis.dir/thirdparty/hiredis/hiredis.c.o: ../thirdparty/hiredis/hiredis.c
	$(CMAKE_COMMAND) -E cmake_progress_report /tmp/tmp.o3wWnieHFs/cmake-build-debug/CMakeFiles $(CMAKE_PROGRESS_4)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object CMakeFiles/hiredis.dir/thirdparty/hiredis/hiredis.c.o"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/hiredis.dir/thirdparty/hiredis/hiredis.c.o   -c /tmp/tmp.o3wWnieHFs/thirdparty/hiredis/hiredis.c

CMakeFiles/hiredis.dir/thirdparty/hiredis/hiredis.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/hiredis.dir/thirdparty/hiredis/hiredis.c.i"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /tmp/tmp.o3wWnieHFs/thirdparty/hiredis/hiredis.c > CMakeFiles/hiredis.dir/thirdparty/hiredis/hiredis.c.i

CMakeFiles/hiredis.dir/thirdparty/hiredis/hiredis.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/hiredis.dir/thirdparty/hiredis/hiredis.c.s"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /tmp/tmp.o3wWnieHFs/thirdparty/hiredis/hiredis.c -o CMakeFiles/hiredis.dir/thirdparty/hiredis/hiredis.c.s

CMakeFiles/hiredis.dir/thirdparty/hiredis/hiredis.c.o.requires:
.PHONY : CMakeFiles/hiredis.dir/thirdparty/hiredis/hiredis.c.o.requires

CMakeFiles/hiredis.dir/thirdparty/hiredis/hiredis.c.o.provides: CMakeFiles/hiredis.dir/thirdparty/hiredis/hiredis.c.o.requires
	$(MAKE) -f CMakeFiles/hiredis.dir/build.make CMakeFiles/hiredis.dir/thirdparty/hiredis/hiredis.c.o.provides.build
.PHONY : CMakeFiles/hiredis.dir/thirdparty/hiredis/hiredis.c.o.provides

CMakeFiles/hiredis.dir/thirdparty/hiredis/hiredis.c.o.provides.build: CMakeFiles/hiredis.dir/thirdparty/hiredis/hiredis.c.o

CMakeFiles/hiredis.dir/thirdparty/hiredis/net.c.o: CMakeFiles/hiredis.dir/flags.make
CMakeFiles/hiredis.dir/thirdparty/hiredis/net.c.o: ../thirdparty/hiredis/net.c
	$(CMAKE_COMMAND) -E cmake_progress_report /tmp/tmp.o3wWnieHFs/cmake-build-debug/CMakeFiles $(CMAKE_PROGRESS_5)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object CMakeFiles/hiredis.dir/thirdparty/hiredis/net.c.o"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/hiredis.dir/thirdparty/hiredis/net.c.o   -c /tmp/tmp.o3wWnieHFs/thirdparty/hiredis/net.c

CMakeFiles/hiredis.dir/thirdparty/hiredis/net.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/hiredis.dir/thirdparty/hiredis/net.c.i"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /tmp/tmp.o3wWnieHFs/thirdparty/hiredis/net.c > CMakeFiles/hiredis.dir/thirdparty/hiredis/net.c.i

CMakeFiles/hiredis.dir/thirdparty/hiredis/net.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/hiredis.dir/thirdparty/hiredis/net.c.s"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /tmp/tmp.o3wWnieHFs/thirdparty/hiredis/net.c -o CMakeFiles/hiredis.dir/thirdparty/hiredis/net.c.s

CMakeFiles/hiredis.dir/thirdparty/hiredis/net.c.o.requires:
.PHONY : CMakeFiles/hiredis.dir/thirdparty/hiredis/net.c.o.requires

CMakeFiles/hiredis.dir/thirdparty/hiredis/net.c.o.provides: CMakeFiles/hiredis.dir/thirdparty/hiredis/net.c.o.requires
	$(MAKE) -f CMakeFiles/hiredis.dir/build.make CMakeFiles/hiredis.dir/thirdparty/hiredis/net.c.o.provides.build
.PHONY : CMakeFiles/hiredis.dir/thirdparty/hiredis/net.c.o.provides

CMakeFiles/hiredis.dir/thirdparty/hiredis/net.c.o.provides.build: CMakeFiles/hiredis.dir/thirdparty/hiredis/net.c.o

CMakeFiles/hiredis.dir/thirdparty/hiredis/read.c.o: CMakeFiles/hiredis.dir/flags.make
CMakeFiles/hiredis.dir/thirdparty/hiredis/read.c.o: ../thirdparty/hiredis/read.c
	$(CMAKE_COMMAND) -E cmake_progress_report /tmp/tmp.o3wWnieHFs/cmake-build-debug/CMakeFiles $(CMAKE_PROGRESS_6)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object CMakeFiles/hiredis.dir/thirdparty/hiredis/read.c.o"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/hiredis.dir/thirdparty/hiredis/read.c.o   -c /tmp/tmp.o3wWnieHFs/thirdparty/hiredis/read.c

CMakeFiles/hiredis.dir/thirdparty/hiredis/read.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/hiredis.dir/thirdparty/hiredis/read.c.i"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /tmp/tmp.o3wWnieHFs/thirdparty/hiredis/read.c > CMakeFiles/hiredis.dir/thirdparty/hiredis/read.c.i

CMakeFiles/hiredis.dir/thirdparty/hiredis/read.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/hiredis.dir/thirdparty/hiredis/read.c.s"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /tmp/tmp.o3wWnieHFs/thirdparty/hiredis/read.c -o CMakeFiles/hiredis.dir/thirdparty/hiredis/read.c.s

CMakeFiles/hiredis.dir/thirdparty/hiredis/read.c.o.requires:
.PHONY : CMakeFiles/hiredis.dir/thirdparty/hiredis/read.c.o.requires

CMakeFiles/hiredis.dir/thirdparty/hiredis/read.c.o.provides: CMakeFiles/hiredis.dir/thirdparty/hiredis/read.c.o.requires
	$(MAKE) -f CMakeFiles/hiredis.dir/build.make CMakeFiles/hiredis.dir/thirdparty/hiredis/read.c.o.provides.build
.PHONY : CMakeFiles/hiredis.dir/thirdparty/hiredis/read.c.o.provides

CMakeFiles/hiredis.dir/thirdparty/hiredis/read.c.o.provides.build: CMakeFiles/hiredis.dir/thirdparty/hiredis/read.c.o

CMakeFiles/hiredis.dir/thirdparty/hiredis/sds.c.o: CMakeFiles/hiredis.dir/flags.make
CMakeFiles/hiredis.dir/thirdparty/hiredis/sds.c.o: ../thirdparty/hiredis/sds.c
	$(CMAKE_COMMAND) -E cmake_progress_report /tmp/tmp.o3wWnieHFs/cmake-build-debug/CMakeFiles $(CMAKE_PROGRESS_7)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object CMakeFiles/hiredis.dir/thirdparty/hiredis/sds.c.o"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/hiredis.dir/thirdparty/hiredis/sds.c.o   -c /tmp/tmp.o3wWnieHFs/thirdparty/hiredis/sds.c

CMakeFiles/hiredis.dir/thirdparty/hiredis/sds.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/hiredis.dir/thirdparty/hiredis/sds.c.i"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /tmp/tmp.o3wWnieHFs/thirdparty/hiredis/sds.c > CMakeFiles/hiredis.dir/thirdparty/hiredis/sds.c.i

CMakeFiles/hiredis.dir/thirdparty/hiredis/sds.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/hiredis.dir/thirdparty/hiredis/sds.c.s"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /tmp/tmp.o3wWnieHFs/thirdparty/hiredis/sds.c -o CMakeFiles/hiredis.dir/thirdparty/hiredis/sds.c.s

CMakeFiles/hiredis.dir/thirdparty/hiredis/sds.c.o.requires:
.PHONY : CMakeFiles/hiredis.dir/thirdparty/hiredis/sds.c.o.requires

CMakeFiles/hiredis.dir/thirdparty/hiredis/sds.c.o.provides: CMakeFiles/hiredis.dir/thirdparty/hiredis/sds.c.o.requires
	$(MAKE) -f CMakeFiles/hiredis.dir/build.make CMakeFiles/hiredis.dir/thirdparty/hiredis/sds.c.o.provides.build
.PHONY : CMakeFiles/hiredis.dir/thirdparty/hiredis/sds.c.o.provides

CMakeFiles/hiredis.dir/thirdparty/hiredis/sds.c.o.provides.build: CMakeFiles/hiredis.dir/thirdparty/hiredis/sds.c.o

CMakeFiles/hiredis.dir/thirdparty/hiredis/sockcompat.c.o: CMakeFiles/hiredis.dir/flags.make
CMakeFiles/hiredis.dir/thirdparty/hiredis/sockcompat.c.o: ../thirdparty/hiredis/sockcompat.c
	$(CMAKE_COMMAND) -E cmake_progress_report /tmp/tmp.o3wWnieHFs/cmake-build-debug/CMakeFiles $(CMAKE_PROGRESS_8)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object CMakeFiles/hiredis.dir/thirdparty/hiredis/sockcompat.c.o"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/hiredis.dir/thirdparty/hiredis/sockcompat.c.o   -c /tmp/tmp.o3wWnieHFs/thirdparty/hiredis/sockcompat.c

CMakeFiles/hiredis.dir/thirdparty/hiredis/sockcompat.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/hiredis.dir/thirdparty/hiredis/sockcompat.c.i"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /tmp/tmp.o3wWnieHFs/thirdparty/hiredis/sockcompat.c > CMakeFiles/hiredis.dir/thirdparty/hiredis/sockcompat.c.i

CMakeFiles/hiredis.dir/thirdparty/hiredis/sockcompat.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/hiredis.dir/thirdparty/hiredis/sockcompat.c.s"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /tmp/tmp.o3wWnieHFs/thirdparty/hiredis/sockcompat.c -o CMakeFiles/hiredis.dir/thirdparty/hiredis/sockcompat.c.s

CMakeFiles/hiredis.dir/thirdparty/hiredis/sockcompat.c.o.requires:
.PHONY : CMakeFiles/hiredis.dir/thirdparty/hiredis/sockcompat.c.o.requires

CMakeFiles/hiredis.dir/thirdparty/hiredis/sockcompat.c.o.provides: CMakeFiles/hiredis.dir/thirdparty/hiredis/sockcompat.c.o.requires
	$(MAKE) -f CMakeFiles/hiredis.dir/build.make CMakeFiles/hiredis.dir/thirdparty/hiredis/sockcompat.c.o.provides.build
.PHONY : CMakeFiles/hiredis.dir/thirdparty/hiredis/sockcompat.c.o.provides

CMakeFiles/hiredis.dir/thirdparty/hiredis/sockcompat.c.o.provides.build: CMakeFiles/hiredis.dir/thirdparty/hiredis/sockcompat.c.o

# Object files for target hiredis
hiredis_OBJECTS = \
"CMakeFiles/hiredis.dir/thirdparty/hiredis/alloc.c.o" \
"CMakeFiles/hiredis.dir/thirdparty/hiredis/async.c.o" \
"CMakeFiles/hiredis.dir/thirdparty/hiredis/dict.c.o" \
"CMakeFiles/hiredis.dir/thirdparty/hiredis/hiredis.c.o" \
"CMakeFiles/hiredis.dir/thirdparty/hiredis/net.c.o" \
"CMakeFiles/hiredis.dir/thirdparty/hiredis/read.c.o" \
"CMakeFiles/hiredis.dir/thirdparty/hiredis/sds.c.o" \
"CMakeFiles/hiredis.dir/thirdparty/hiredis/sockcompat.c.o"

# External object files for target hiredis
hiredis_EXTERNAL_OBJECTS =

libhiredis.so: CMakeFiles/hiredis.dir/thirdparty/hiredis/alloc.c.o
libhiredis.so: CMakeFiles/hiredis.dir/thirdparty/hiredis/async.c.o
libhiredis.so: CMakeFiles/hiredis.dir/thirdparty/hiredis/dict.c.o
libhiredis.so: CMakeFiles/hiredis.dir/thirdparty/hiredis/hiredis.c.o
libhiredis.so: CMakeFiles/hiredis.dir/thirdparty/hiredis/net.c.o
libhiredis.so: CMakeFiles/hiredis.dir/thirdparty/hiredis/read.c.o
libhiredis.so: CMakeFiles/hiredis.dir/thirdparty/hiredis/sds.c.o
libhiredis.so: CMakeFiles/hiredis.dir/thirdparty/hiredis/sockcompat.c.o
libhiredis.so: CMakeFiles/hiredis.dir/build.make
libhiredis.so: CMakeFiles/hiredis.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking C shared library libhiredis.so"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/hiredis.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/hiredis.dir/build: libhiredis.so
.PHONY : CMakeFiles/hiredis.dir/build

CMakeFiles/hiredis.dir/requires: CMakeFiles/hiredis.dir/thirdparty/hiredis/alloc.c.o.requires
CMakeFiles/hiredis.dir/requires: CMakeFiles/hiredis.dir/thirdparty/hiredis/async.c.o.requires
CMakeFiles/hiredis.dir/requires: CMakeFiles/hiredis.dir/thirdparty/hiredis/dict.c.o.requires
CMakeFiles/hiredis.dir/requires: CMakeFiles/hiredis.dir/thirdparty/hiredis/hiredis.c.o.requires
CMakeFiles/hiredis.dir/requires: CMakeFiles/hiredis.dir/thirdparty/hiredis/net.c.o.requires
CMakeFiles/hiredis.dir/requires: CMakeFiles/hiredis.dir/thirdparty/hiredis/read.c.o.requires
CMakeFiles/hiredis.dir/requires: CMakeFiles/hiredis.dir/thirdparty/hiredis/sds.c.o.requires
CMakeFiles/hiredis.dir/requires: CMakeFiles/hiredis.dir/thirdparty/hiredis/sockcompat.c.o.requires
.PHONY : CMakeFiles/hiredis.dir/requires

CMakeFiles/hiredis.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/hiredis.dir/cmake_clean.cmake
.PHONY : CMakeFiles/hiredis.dir/clean

CMakeFiles/hiredis.dir/depend:
	cd /tmp/tmp.o3wWnieHFs/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /tmp/tmp.o3wWnieHFs /tmp/tmp.o3wWnieHFs /tmp/tmp.o3wWnieHFs/cmake-build-debug /tmp/tmp.o3wWnieHFs/cmake-build-debug /tmp/tmp.o3wWnieHFs/cmake-build-debug/CMakeFiles/hiredis.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/hiredis.dir/depend

