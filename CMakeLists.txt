cmake_minimum_required(VERSION 3.8)
project(project1)

find_package(FLEX)
FLEX_TARGET(Flexer flexer.l flexer.cpp)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_FLAG "${CMAKE_CPP_FLAGS} -Wall -Wno-conversion - Wno-depracated")

set(SOURCE_FILES main.cpp hlexer.cpp ${FLEX_Flexer_OUTPUTS} hlexer.h flexer.h)
add_executable(project1 ${SOURCE_FILES})