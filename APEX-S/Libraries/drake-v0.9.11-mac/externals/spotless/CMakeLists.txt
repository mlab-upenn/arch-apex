cmake_minimum_required(VERSION 2.6.0)
#cmake_minimum_required(VERSION 2.8.8)  # need the object library

# set up pods
set(POD_NAME spotless)
include(cmake/pods.cmake)

get_relative_path("${CMAKE_INSTALL_PREFIX}/matlab" "${CMAKE_CURRENT_SOURCE_DIR}" relpath)

# setup matlab pods-compliance
include(cmake/matlab_pods.cmake)
pods_configure_matlab_paths()

find_program(matlab matlab)
if (NOT matlab )
  message(FATAL_ERROR "Could not find matlab executable")
endif()

add_custom_target(run ALL
			  DEPENDS
			  "${CMAKE_INSTALL_PREFIX}/matlab/addpath_spotless.m"
			  "${CMAKE_INSTALL_PREFIX}/matlab/rmpath_spotless.m")

add_custom_command(OUTPUT "${CMAKE_INSTALL_PREFIX}/matlab/addpath_spotless.m" "${CMAKE_INSTALL_PREFIX}/matlab/rmpath_spotless.m"
			  COMMAND ${matlab} -wait -nosplash -nodesktop -nodisplay -r "\"cd('${CMAKE_CURRENT_SOURCE_DIR}');spot_pods_install('${CMAKE_INSTALL_PREFIX}/matlab','${relpath}');exit\""
			  DEPENDS
			    "${CMAKE_CURRENT_SOURCE_DIR}/spotless/spot_install.m"
			    "${CMAKE_CURRENT_SOURCE_DIR}/spot_pods_install.m"
        )

add_custom_target(install DEPENDS all) 
