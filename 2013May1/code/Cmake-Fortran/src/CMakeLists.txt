# CMake project file for NORMA

cmake_minimum_required (VERSION 2.8)
project (MTF4-ec-0411-11.31)
enable_language (Fortran)

add_subdirectory(${CMAKE_SOURCE_DIR}/event/)
LINK_DIRECTORIES (${CMAKE_SOURCE_DIR}/event/)

set(LIBRARY_OUTPUT_PATH "${CMAKE_BINARY_DIR}/lib")
set(EXECUTABLE_OUTPUT_PATH "${CMAKE_BINARY_DIR}/bin")

# make sure that the default is a RELEASE
if (NOT CMAKE_BUILD_TYPE)
  set (CMAKE_BUILD_TYPE RELEASE CACHE STRING
      "Choose the type of build, options are: None Debug Release."
      FORCE)
endif (NOT CMAKE_BUILD_TYPE)

#if use mpi library please use mpiifort
set (CMAKE_Fortran_COMPILER mpiifort)
set (CMAKE_Fortran_FLAGS_RELEASE "-O3")
set (CMAKE_Fortran_FLAGS_DEBUG   "-O0 -g")

message("-- Use compiler ${CMAKE_FC_COMPILER}")

include_directories( 

${CMAKE_SOURCE_DIR}/event/
)

# build executables
set (src 
${CMAKE_SOURCE_DIR}/core/Sample.F90
)

set(MakePlot_src
${CMAKE_SOURCE_DIR}/MakePlot/main.cpp
)

add_executable (MTF4.exe ${src})

add_executable (makeplot.exe ${MakePlot_src})
target_link_libraries(makeplot.exe Event)

