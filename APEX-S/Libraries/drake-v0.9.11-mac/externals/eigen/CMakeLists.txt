cmake_minimum_required(VERSION 2.8.0)
project(eigen)

include(ExternalProject)

# PODs out-of-source build logic
if (CMAKE_INSTALL_PREFIX STREQUAL "/usr/local" OR CMAKE_INSTALL_PREFIX STREQUAL "C:/Program Files/${PROJECT_NAME}")
  find_file(_build_dir build PATHS ${PROJECT_SOURCE_DIR} ${PROJECT_SOURCE_DIR}/.. ${PROJECT_SOURCE_DIR}/../.. ${PROJECT_SOURCE_DIR}/../../.. ${PROJECT_SOURCE_DIR}/../../../..)
  if (_build_dir)
      set(CMAKE_INSTALL_PREFIX "${_build_dir}")
  else()
    execute_process(COMMAND ${CMAKE_COMMAND} -E make_directory ${PROJECT_SOURCE_DIR}/build)
    set(CMAKE_INSTALL_PREFIX ${PROJECT_SOURCE_DIR}/build)
  endif()
endif()
message(STATUS CMAKE_INSTALL_PREFIX=${CMAKE_INSTALL_PREFIX})


#set(ENV{PKG_CONFIG_LIBDIR} "${CMAKE_INSTALL_PREFIX}/lib")
# Note: this doesn't survive through to the configure step of the extenal project (http://cmake.3232098.n2.nabble.com/Pass-PATH-to-ExternalProject-Add-td5788195.html).  added an install version below

ExternalProject_Add(eigen
  URL https://bitbucket.org/eigen/eigen/get/3.2.5.tar.bz2
  URL_MD5 21a928f6e0f1c7f24b6f63ff823593f5
  PATCH_COMMAND cmake -E copy ${PROJECT_SOURCE_DIR}/AutoDiffScalar-patched.h unsupported/Eigen/src/AutoDiff/AutoDiffScalar.h
  CONFIGURE_COMMAND ""
  BUILD_COMMAND ""
  INSTALL_COMMAND "")
#  CMAKE_ARGS -G${CMAKE_GENERATOR} -DCMAKE_INSTALL_PREFIX=${CMAKE_INSTALL_PREFIX} -DEIGEN_BUILD_PKGCONFIG=ON)

# this was cleaner (more platform independent) than writing a wrapper shell script around CMAKE
ExternalProject_Get_Property(eigen SOURCE_DIR)

file(MAKE_DIRECTORY ${CMAKE_INSTALL_PREFIX}/include/eigen3)
install(DIRECTORY ${SOURCE_DIR}/Eigen ${SOURCE_DIR}/unsupported
        DESTINATION ${CMAKE_INSTALL_PREFIX}/include/eigen3)

install(FILES ${SOURCE_DIR}/signature_of_eigen3_matrix_library
        DESTINATION ${CMAKE_INSTALL_PREFIX}/include/eigen3)


# and finally the configure file
set(EIGEN_VERSION_NUMBER 3.2.5)
set(INCLUDE_INSTALL_DIR ${CMAKE_INSTALL_PREFIX}/include/eigen3)
configure_file(eigen3.pc.in eigen3.pc)
file(MAKE_DIRECTORY ${CMAKE_INSTALL_PREFIX}/lib/pkgconfig)
install(FILES ${CMAKE_CURRENT_BINARY_DIR}/eigen3.pc
        DESTINATION ${CMAKE_INSTALL_PREFIX}/lib/pkgconfig)
