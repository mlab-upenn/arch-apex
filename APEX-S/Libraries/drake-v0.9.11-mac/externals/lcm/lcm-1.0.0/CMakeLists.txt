cmake_minimum_required(VERSION 2.8.6) # for UseJava.cmake

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")

# set up pods
set(POD_NAME lcm)
set(LCM_VERSION 1.0.0)
include(cmake/pods.cmake)

if (CMAKE_COMPILER_IS_GNUCC)
   set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=gnu99 -Wall -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_REENTRANT -Wno-unused-parameter -Wno-format-zero-length -Wshadow")
   set(CMAKE_C_FLAGS "${CMAKE_CXX_FLAGS} -std=gnu99 -Wall -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_REENTRANT -Wno-unused-parameter -Wno-format-zero-length -Wshadow")
elseif ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "Clang")
   set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wreturn-type -Wuninitialized -Wunused-variable") # -Wunused-parameter")

  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")
  if (APPLE)  
   set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -stdlib=libc++")  
  endif()
endif()

if (WIN32)
#  add_definitions(/TP)  # compile .c as .cpp for MSVC
  add_subdirectory(WinSpecific)
  include_directories(${CMAKE_CURRENT_SOURCE_DIR}/WinSpecific/include)
  include_directories(${CMAKE_CURRENT_SOURCE_DIR}/WinSpecific/getopt)
endif()

enable_testing()
include(CTest)

include_directories(${CMAKE_CURRENT_SOURCE_DIR})

#add_subdirectory(m4)
add_subdirectory(lcm)
add_subdirectory(liblcm-test)
add_subdirectory(lcmgen)
add_subdirectory(lcm-logger)
#add_subdirectory(po)
#add_subdirectory(m4macros)

# set up Java, use a target of 1.6
find_package(Java 1.6)
if (JAVA_FOUND)
   include(UseJava)
   set(CMAKE_JAVA_COMPILE_FLAGS ${CMAKE_JAVA_COMPILE_FLAGS} -source 1.6 -target 1.6)

  add_subdirectory(lcm-java)
endif()

find_package(PythonInterp)
if (PYTHONINTERP_FOUND AND NOT WIN32)
  add_subdirectory(lcm-python)
endif()

# todo: add "if lua" logic
#add_subdirectory(lcm-lua)



