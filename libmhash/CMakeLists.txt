cmake_minimum_required(VERSION 3.7)

PROJECT("mhash")

INCLUDE(ExternalProject)

SET(VERSION_EXTERNAL "0.9.9.9")
SET(VERSION_PACKAGE "1")


#----------------------------------------------------------------------------
#
# Set custom definitions for several compiler.
#

# Microsoft: Do not show msvs security warnings about unsafe functions.
IF(${CMAKE_BUILD_TOOL} MATCHES "(msdev|VCExpress|devenv|nmake)")
	ADD_DEFINITIONS(-D_CRT_SECURE_NO_WARNINGS)
	ADD_DEFINITIONS(-D_CRT_SECURE_NO_DEPRECATE)
ENDIF(${CMAKE_BUILD_TOOL} MATCHES "(msdev|VCExpress|devenv|nmake)")


# Microsoft: Set warning level to 2.
IF(${CMAKE_BUILD_TOOL} MATCHES "(msdev|VCExpress|devenv)")
	ADD_DEFINITIONS(/W2)
ENDIF(${CMAKE_BUILD_TOOL} MATCHES "(msdev|VCExpress|devenv)")


#----------------------------------------------------------------------------
#
# Build the project.
#

SET(SUB_CMAKE_ARGS "")
LIST(APPEND SUB_CMAKE_ARGS "-DCMAKE_C_FLAGS=${CMAKE_C_FLAGS}")
LIST(APPEND SUB_CMAKE_ARGS "-DCMAKE_SYSTEM_NAME=${CMAKE_SYSTEM_NAME}")
LIST(APPEND SUB_CMAKE_ARGS "-DCMAKE_C_COMPILER=${CMAKE_C_COMPILER}")
LIST(APPEND SUB_CMAKE_ARGS "-DCMAKE_CXX_COMPILER=${CMAKE_CXX_COMPILER}")
LIST(APPEND SUB_CMAKE_ARGS "-DCMAKE_INSTALL_PREFIX=${CMAKE_CURRENT_BINARY_DIR}/install")
LIST(APPEND SUB_CMAKE_ARGS "-DVERSION_EXTERNAL=${VERSION_EXTERNAL}")
IF(${CMAKE_SYSTEM_NAME} STREQUAL "Windows")
	LIST(APPEND SUB_CMAKE_ARGS "-DCMAKE_RC_COMPILER=${CMAKE_RC_COMPILER}")
ENDIF(${CMAKE_SYSTEM_NAME} STREQUAL "Windows")


ExternalProject_Add(TARGET_mhash
                    PREFIX ${CMAKE_CURRENT_BINARY_DIR}/mhash-${VERSION_EXTERNAL}
                    URL ${CMAKE_CURRENT_SOURCE_DIR}/mhash-${VERSION_EXTERNAL}.tar.bz2
                    URL_HASH SHA1=d6f324e70a42a8bbf7a5458521257225afcf0caf
                    PATCH_COMMAND ${CMAKE_COMMAND} -E copy_directory ${CMAKE_CURRENT_SOURCE_DIR}/templates ${CMAKE_CURRENT_BINARY_DIR}/mhash-${VERSION_EXTERNAL}/src/TARGET_mhash
                    CMAKE_ARGS ${SUB_CMAKE_ARGS}
                    INSTALL_COMMAND make install DESTDIR=${CMAKE_CURRENT_BINARY_DIR}
)

#----------------------------------------------------------------------------

# Write a version file.
FILE(WRITE ${CMAKE_CURRENT_BINARY_DIR}/install/libmhash.version "SET(libmhash_VERSION ${VERSION_EXTERNAL}.${VERSION_PACKAGE})")
