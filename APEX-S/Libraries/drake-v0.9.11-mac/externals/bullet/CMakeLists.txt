cmake_minimum_required(VERSION 2.8.0)
project(bullet)

include(ExternalProject)

set(BULLET_OPTIONS -DINSTALL_LIBS=on 
		 -DPKGCONFIG_INSTALL_PREFIX=${CMAKE_INSTALL_PREFIX}/lib/pkgconfig
		 -DBUILD_BULLET2_DEMOS=off 
		 -DBUILD_CPU_DEMOS=off 
		 -DBUILD_EXTRAS=off 
		 -DBUILD_OPENGL3_DEMOS=off
		 -DBUILD_UNIT_TESTS=off
		 -DUSE_DOUBLE_PRECISION=on) 

if (WIN32)
	list(APPEND BULLET_OPTIONS -DUSE_MSVC_RUNTIME_LIBRARY_DLL=off)
else()
	list(APPEND BULLET_OPTIONS -DBUILD_SHARED_LIBS=on)   # shared libs doesn't work with msvc (there aren't any dllexports defined) 
endif()

ExternalProject_Add(bullet3
  URL https://github.com/bulletphysics/bullet3/archive/2.83.6.tar.gz
#  URL_MD5 21a928f6e0f1c7f24b6f63ff823593f5
  CMAKE_ARGS -G${CMAKE_GENERATOR} 
  			 -DCMAKE_INSTALL_PREFIX=${CMAKE_INSTALL_PREFIX} 
  			 -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE} 
  			 ${BULLET_OPTIONS}
  PATCH_COMMAND patch -p0 -i ${PROJECT_SOURCE_DIR}/bullet_gjk_accuracy_patch.diff 
  	COMMAND ${CMAKE_COMMAND} -E rename src/LinearMath/btScalar.h src/LinearMath/btScalar.h.in
  	COMMAND patch -p0 -i ${PROJECT_SOURCE_DIR}/bullet_double_precision_patch.diff
	COMMAND patch -p0 -i ${PROJECT_SOURCE_DIR}/bullet_windows_pkgconfig.diff
  )

add_custom_target(install DEPENDS bullet3)  # just to have an explicit install rule

if (APPLE)
	set(BULLET_INSTALL_LIBS 
		libBullet3OpenCL_clew.2.83.dylib 
		libBullet2FileLoader.2.83.dylib 
		libBullet3Dynamics.2.83.dylib 
		libBullet3Collision.2.83.dylib 
		libBullet3Geometry.2.83.dylib 
		libBullet3Common.2.83.dylib 
		libBulletSoftBody.2.83.dylib 
		libBulletCollision.2.83.dylib 
		libBulletDynamics.2.83.dylib 
		libLinearMath.2.83.dylib )	

	foreach(__lib ${BULLET_INSTALL_LIBS})
		set(fixup_deplib_command)
		foreach(__deplib ${BULLET_INSTALL_LIBS})		
			list(APPEND fixup_deplib_command  
				COMMAND install_name_tool -change ${__deplib} ${CMAKE_INSTALL_PREFIX}/lib/${__deplib} ${CMAKE_INSTALL_PREFIX}/lib/${__lib} )
		endforeach()
		add_custom_target(fixup_rpath_${__lib} 
			COMMAND install_name_tool -id ${CMAKE_INSTALL_PREFIX}/lib/${__lib}  ${CMAKE_INSTALL_PREFIX}/lib/${__lib}
			${fixup_deplib_command}
			DEPENDS bullet3)
		add_dependencies(install fixup_rpath_${__lib})
	endforeach()
endif()