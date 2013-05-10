CMAKE_MINIMUM_REQUIRED(VERSION 2.8.0)
project(multLibs)
add_subdirectory(${CMAKE_SOURCE_DIR}/lib1/)
LINK_DIRECTORIES (${CMAKE_SOURCE_DIR}/lib1/)
add_subdirectory(${CMAKE_SOURCE_DIR}/event/)
LINK_DIRECTORIES (${CMAKE_SOURCE_DIR}/event/)
add_subdirectory(${CMAKE_SOURCE_DIR}/FFT/)
LINK_DIRECTORIES (${CMAKE_SOURCE_DIR}/FFT/)

set(CMAKE_BUILD_TYPE Debug)

set(LIBRARY_OUTPUT_PATH "${CMAKE_BINARY_DIR}/lib")
set(EXECUTABLE_OUTPUT_PATH "${CMAKE_BINARY_DIR}/bin")

IF(CMAKE_BUILD_TYPE MATCHES Debug)
    ADD_DEFINITIONS(-DDEBUG)    
    MESSAGE(DebugModeOpen)
ELSE(CMAKE_BUILD_TYPE MATCHES Debug)
    MESSAGE( ReleaseModeOpen )
ENDIF(CMAKE_BUILD_TYPE MATCHES Debug)

if (CMAKE_SYSTEM_NAME MATCHES Darwin)
   EXEC_PROGRAM("sw_vers -productVersion | cut -d . -f 1-2" OUTPUT_VARIABLE MAC_OS_VERSION)
   MESSAGE("--- Found a Mac OS X System ${MAC_OS_VERSION}")
   if (CMAKE_COMPILER_IS_GNUCXX)
      MESSAGE("--- Found GNU compiler collection")

      STRING(COMPARE EQUAL "10.5" "${MAC_OS_VERSION}" MAC_OS_10_5)
      IF(MAC_OS_10_5)
        SET(CMAKE_CXX_FLAGS "-m64")
        SET(CMAKE_Fortran_FLAGS "-m64")
      ENDIF(MAC_OS_10_5)

      SET(CMAKE_SHARED_LIBRARY_CREATE_C_FLAGS "${CMAKE_SHARED_LIBRARY_CREATE_C_FLAGS} -flat_namespace -single_module -undefined dynamic_lookup")
      SET(CMAKE_SHARED_LIBRARY_CREATE_CXX_FLAGS "${CMAKE_SHARED_LIBRARY_CREATE_CXX_FLAGS} -flat_namespace -single_module -undefined dynamic_lookup")

      # Select flags.
      set(CMAKE_CXX_FLAGS_RELWITHDEBINFO "-O2 -g")
      set(CMAKE_CXX_FLAGS_RELEASE        "-O2")
      set(CMAKE_CXX_FLAGS_DEBUG          "-g -O2 -fno-reorder-blocks -fno-schedule-insns -fno-inline")
      set(CMAKE_CXX_FLAGS_DEBUGFULL      "-g3 -fno-inline -Wnon-virtual-dtor -Wno-long-long -ansi -Wundef -Wcast-align -Wchar-subscripts -Wall -W -Wpointer-arith -Wformat-security -fno-exceptions -fno-check-new -fno-common")
      set(CMAKE_CXX_FLAGS_PROFILE        "-g3 -fno-inline -ftest-coverage -fprofile-arcs")
      set(CMAKE_C_FLAGS_RELWITHDEBINFO   "-O2 -g")
      set(CMAKE_C_FLAGS_RELEASE          "-O2")
      set(CMAKE_C_FLAGS_DEBUG            "-g -O2 -fno-reorder-blocks -fno-schedule-insns -fno-inline")
      set(CMAKE_C_FLAGS_DEBUGFULL        "-g3 -fno-inline -Wno-long-long -std=iso9899:1990 -Wundef -Wcast-align -Werror-implicit-function-declaration -Wchar-subscripts -Wall -W -Wpointer-arith -Wwrite-strings -Wformat-security -Wmissing-format-attribute -fno-common")
      set(CMAKE_C_FLAGS_PROFILE          "-g3 -fno-inline -ftest-coverage -fprofile-arcs")
      endif (CMAKE_COMPILER_IS_GNUCXX)
endif (CMAKE_SYSTEM_NAME MATCHES Darwin) 

# List of source files
set(Core_SRCS
${CMAKE_SOURCE_DIR}/Core/main.cpp
)


# fill list of header files 
set(Core_HEADERS 
)


# Set the library version in the main CMakeLists.txt
SET(Core_MAJOR_VERSION 0)
SET(Core_MINOR_VERSION 0)
SET(Core_PATCH_VERSION 0)
SET(Core_VERSION "${Core_MAJOR_VERSION}.${Core_MINOR_VERSION}.${Core_PATCH_VERSION}")
SET(Core_LIBRARY_PROPERTIES ${Core_LIBRARY_PROPERTIES}
    VERSION "${Core_VERSION}"
    SOVERSION "${Core_MAJOR_VERSION}"
    SUFFIX ".exe"
)

#include files

include_directories( 
${CMAKE_SOURCE_DIR}/lib1/
${CMAKE_SOURCE_DIR}/event/
${CMAKE_SOURCE_DIR}/FFT/
)

#set project library




############### build the executable #####################
add_executable(Core ${Core_SRCS})
target_link_libraries(Core lib1)
target_link_libraries(Core Event)
target_link_libraries(Core FFT)

set_target_properties(Core PROPERTIES ${Core_LIBRARY_PROPERTIES})



