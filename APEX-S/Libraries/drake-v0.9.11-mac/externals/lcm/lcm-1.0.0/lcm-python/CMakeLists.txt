add_custom_target(install_python ALL
	COMMAND ${PYTHON_EXECUTABLE} setup.py build --build-base=${CMAKE_CURRENT_BINARY_DIR} 
	build_ext --include-dirs="${CMAKE_BINARY_DIR}/include" --library-dirs="${CMAKE_BINARY_DIR}/lib"
	install --prefix=${CMAKE_INSTALL_PREFIX}
	WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR})
