
if (NOT MSVC OR NOT ${CMAKE_CXX_COMPILER_VERSION} VERSION_GREATER 19.0.0)
# linker currently dies with LINK : fatal error LNK1000: Internal error during IncrBuildImage.Pass1
# todo: resolve this!

add_executable(lcm-logger lcm_logger.c glib_util.c)
target_link_libraries(lcm-logger lcm)
pods_use_pkg_config_packages(lcm-logger glib-2.0)
pods_install_executables(lcm-logger)

add_executable(lcm-logplayer lcm_logplayer.c)
target_link_libraries(lcm-logplayer lcm)
pods_install_executables(lcm-logplayer)

if (WIN32)
  set_source_files_properties(lcm_logger.c glib_util.c lcm_logplayer.c PROPERTIES COMPILE_FLAGS /TP)
  target_link_libraries(lcm-logger getopt)
  target_link_libraries(lcm-logplayer getopt)
endif(WIN32)

endif()
