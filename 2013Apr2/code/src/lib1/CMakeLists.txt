#require Cmake version
CMAKE_MINIMUM_REQUIRED(VERSION 2.8.0)

#build type
set(CMAKE_BUILD_TYPE Debug)

#target output path notice that : the variable CMAKE_BINARY_DIR is the CMAKE self global variable
set(LIBRARY_OUTPUT_PATH "${CMAKE_BINARY_DIR}/lib")
set(EXECUTABLE_OUTPUT_PATH "${CMAKE_BINARY_DIR}/bin")

#adject the compiler parameter
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
set(lib1_SRCS
${CMAKE_SOURCE_DIR}/lib1/lib1.cpp
)

# fill list of header files 
set(lib1_HEADERS 
${CMAKE_SOURCE_DIR}/lib1/lib1.h
)

SET(lib1_SRCS ${lib1_SRCS}) 


# Set the library version
SET(lib1_MAJOR_VERSION 0)
SET(lib1_MINOR_VERSION 0)
SET(lib1_PATCH_VERSION 0)
SET(lib1_VERSION "${lib1_MAJOR_VERSION}.${lib1_MINOR_VERSION}.${lib1_PATCH_VERSION}")
SET(lib1_LIBRARY_PROPERTIES ${lib1_LIBRARY_PROPERTIES}
    VERSION "${lib1_VERSION}"
    SOVERSION "${lib1_MAJOR_VERSION}"
    SUFFIX ".so"
)


############### build the library #####################
#declare the library name. the keyword SHARED mean to build a shared library(.so) if have not this
	#statement build static library(.a) 
add_library(lib1 SHARED ${lib1_SRCS})
#add the property decalare in previous
set_target_properties(lib1 PROPERTIES ${lib1_LIBRARY_PROPERTIES})



