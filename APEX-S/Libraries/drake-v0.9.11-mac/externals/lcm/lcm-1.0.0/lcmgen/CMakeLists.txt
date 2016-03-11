
add_executable(lcm-gen 
		       main.c 
		       sprintfalloc.c
		       lcmgen.c
		       getopt.c
		       tokenize.c
		       emit_c.c
		       emit_cpp.c
		       emit_java.c
		       emit_csharp.c
		       emit_python.c
		       emit_lua.c )

if (WIN32)
   set_source_files_properties(
		       main.c 
		       sprintfalloc.c
		       lcmgen.c
		       getopt.c
		       tokenize.c
		       emit_c.c
		       emit_cpp.c
		       emit_java.c
		       emit_csharp.c
		       emit_python.c
		       emit_lua.c 
		       PROPERTIES COMPILE_FLAGS /TP)
endif()

pods_use_pkg_config_packages(lcm-gen glib-2.0)

pods_install_executables(lcm-gen)
