# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.9

# Default target executed when no arguments are given to make.
default_target: all

.PHONY : default_target

# Allow only one "make -f Makefile2" at a time, but pass parallelism.
.NOTPARALLEL:


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

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/ap/code/HR/THYD/project1

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/ap/code/HR/THYD/project1

#=============================================================================
# Targets provided globally by CMake.

# Special rule for the target rebuild_cache
rebuild_cache:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "Running CMake to regenerate build system..."
	/usr/bin/cmake -H$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR)
.PHONY : rebuild_cache

# Special rule for the target rebuild_cache
rebuild_cache/fast: rebuild_cache

.PHONY : rebuild_cache/fast

# Special rule for the target edit_cache
edit_cache:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "Running CMake cache editor..."
	/usr/bin/ccmake -H$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR)
.PHONY : edit_cache

# Special rule for the target edit_cache
edit_cache/fast: edit_cache

.PHONY : edit_cache/fast

# The main all target
all: cmake_check_build_system
	$(CMAKE_COMMAND) -E cmake_progress_start /home/ap/code/HR/THYD/project1/CMakeFiles /home/ap/code/HR/THYD/project1/CMakeFiles/progress.marks
	$(MAKE) -f CMakeFiles/Makefile2 all
	$(CMAKE_COMMAND) -E cmake_progress_start /home/ap/code/HR/THYD/project1/CMakeFiles 0
.PHONY : all

# The main clean target
clean:
	$(MAKE) -f CMakeFiles/Makefile2 clean
.PHONY : clean

# The main clean target
clean/fast: clean

.PHONY : clean/fast

# Prepare targets for installation.
preinstall: all
	$(MAKE) -f CMakeFiles/Makefile2 preinstall
.PHONY : preinstall

# Prepare targets for installation.
preinstall/fast:
	$(MAKE) -f CMakeFiles/Makefile2 preinstall
.PHONY : preinstall/fast

# clear depends
depend:
	$(CMAKE_COMMAND) -H$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR) --check-build-system CMakeFiles/Makefile.cmake 1
.PHONY : depend

#=============================================================================
# Target rules for targets named project1

# Build rule for target.
project1: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 project1
.PHONY : project1

# fast build rule for target.
project1/fast:
	$(MAKE) -f CMakeFiles/project1.dir/build.make CMakeFiles/project1.dir/build
.PHONY : project1/fast

flexer.o: flexer.cpp.o

.PHONY : flexer.o

# target to build an object file
flexer.cpp.o:
	$(MAKE) -f CMakeFiles/project1.dir/build.make CMakeFiles/project1.dir/flexer.cpp.o
.PHONY : flexer.cpp.o

flexer.i: flexer.cpp.i

.PHONY : flexer.i

# target to preprocess a source file
flexer.cpp.i:
	$(MAKE) -f CMakeFiles/project1.dir/build.make CMakeFiles/project1.dir/flexer.cpp.i
.PHONY : flexer.cpp.i

flexer.s: flexer.cpp.s

.PHONY : flexer.s

# target to generate assembly for a file
flexer.cpp.s:
	$(MAKE) -f CMakeFiles/project1.dir/build.make CMakeFiles/project1.dir/flexer.cpp.s
.PHONY : flexer.cpp.s

hlexer.o: hlexer.cpp.o

.PHONY : hlexer.o

# target to build an object file
hlexer.cpp.o:
	$(MAKE) -f CMakeFiles/project1.dir/build.make CMakeFiles/project1.dir/hlexer.cpp.o
.PHONY : hlexer.cpp.o

hlexer.i: hlexer.cpp.i

.PHONY : hlexer.i

# target to preprocess a source file
hlexer.cpp.i:
	$(MAKE) -f CMakeFiles/project1.dir/build.make CMakeFiles/project1.dir/hlexer.cpp.i
.PHONY : hlexer.cpp.i

hlexer.s: hlexer.cpp.s

.PHONY : hlexer.s

# target to generate assembly for a file
hlexer.cpp.s:
	$(MAKE) -f CMakeFiles/project1.dir/build.make CMakeFiles/project1.dir/hlexer.cpp.s
.PHONY : hlexer.cpp.s

main.o: main.cpp.o

.PHONY : main.o

# target to build an object file
main.cpp.o:
	$(MAKE) -f CMakeFiles/project1.dir/build.make CMakeFiles/project1.dir/main.cpp.o
.PHONY : main.cpp.o

main.i: main.cpp.i

.PHONY : main.i

# target to preprocess a source file
main.cpp.i:
	$(MAKE) -f CMakeFiles/project1.dir/build.make CMakeFiles/project1.dir/main.cpp.i
.PHONY : main.cpp.i

main.s: main.cpp.s

.PHONY : main.s

# target to generate assembly for a file
main.cpp.s:
	$(MAKE) -f CMakeFiles/project1.dir/build.make CMakeFiles/project1.dir/main.cpp.s
.PHONY : main.cpp.s

# Help Target
help:
	@echo "The following are some of the valid targets for this Makefile:"
	@echo "... all (the default if no target is provided)"
	@echo "... clean"
	@echo "... depend"
	@echo "... rebuild_cache"
	@echo "... project1"
	@echo "... edit_cache"
	@echo "... flexer.o"
	@echo "... flexer.i"
	@echo "... flexer.s"
	@echo "... hlexer.o"
	@echo "... hlexer.i"
	@echo "... hlexer.s"
	@echo "... main.o"
	@echo "... main.i"
	@echo "... main.s"
.PHONY : help



#=============================================================================
# Special targets to cleanup operation of make.

# Special rule to run CMake to check the build system integrity.
# No rule that depends on this can have commands that come from listfiles
# because they might be regenerated.
cmake_check_build_system:
	$(CMAKE_COMMAND) -H$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR) --check-build-system CMakeFiles/Makefile.cmake 0
.PHONY : cmake_check_build_system

