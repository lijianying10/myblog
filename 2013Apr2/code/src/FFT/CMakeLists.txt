cmake_minimum_required(VERSION 2.6)

PROJECT(FFT)

set(LIBRARY_OUTPUT_PATH "${CMAKE_BINARY_DIR}/lib")
set(EXECUTABLE_OUTPUT_PATH "${CMAKE_BINARY_DIR}/bin")

set(FFTW_INCLUDE_DIR 
/opt/fftw/include
)

set(FFTW_LIBRARIES
/opt/fftw/lib/libfftw3.so
)

INCLUDE_DIRECTORIES("${FFTW_INCLUDE_DIR}")

add_library(FFT SHARED FFT.cxx)

TARGET_LINK_LIBRARIES(FFT ${FFTW_LIBRARIES}
