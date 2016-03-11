

add_library(lcm SHARED
	lcm.c 
	lcm_udp.c 
	lcm_file.c 
	lcm_tcpq.c 
	ringbuffer.c
	eventlog.c )
if (WIN32)
   add_subdirectory(windows)
   target_link_libraries(lcm lcm_windows)
   set_source_files_properties(lcm.c lcm_udp.c lcm_file.c lcm_tcpq.c ringbuffer.c eventlog.c PROPERTIES COMPILE_FLAGS /TP)
endif()

set(REQUIRED_LIBS glib-2.0 gthread-2.0)
pods_use_pkg_config_packages(lcm ${REQUIRED_LIBS})

pods_install_libraries(lcm)

pods_install_headers(eventlog.h 
				lcm.h 
				lcm_coretypes.h
				lcm-cpp.hpp 
				lcm-cpp-impl.hpp 
				DESTINATION lcm)

pods_install_pkg_config_file(lcm
    LIBS -llcm
    REQUIRES ${REQUIRED_LIBS}
    VERSION ${LCM_VERSION})
