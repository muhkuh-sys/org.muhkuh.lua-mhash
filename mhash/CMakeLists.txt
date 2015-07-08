cmake_minimum_required(VERSION 3.2.3)

PROJECT("mhash")

INCLUDE(ExternalProject)


#----------------------------------------------------------------------------
#
# Build the project.
#

SET(MHASH_CMAKE_ARGS "")
LIST(APPEND MHASH_CMAKE_ARGS "-DCMAKE_C_FLAGS=${CMAKE_C_FLAGS}")
LIST(APPEND MHASH_CMAKE_ARGS "-DCMAKE_SYSTEM_NAME=${CMAKE_SYSTEM_NAME}")
LIST(APPEND MHASH_CMAKE_ARGS "-DCMAKE_C_COMPILER=${CMAKE_C_COMPILER}")
LIST(APPEND MHASH_CMAKE_ARGS "-DCMAKE_CXX_COMPILER=${CMAKE_CXX_COMPILER}")
IF(${CMAKE_SYSTEM_NAME} STREQUAL "Windows")
	LIST(APPEND MHASH_CMAKE_ARGS "-DCMAKE_RC_COMPILER=${CMAKE_RC_COMPILER}")
ENDIF(${CMAKE_SYSTEM_NAME} STREQUAL "Windows")

ExternalProject_Add(TARGET_mhash
                    PREFIX ${CMAKE_CURRENT_BINARY_DIR}/mhash-0.9.9.9
                    URL ${CMAKE_CURRENT_SOURCE_DIR}/mhash-0.9.9.9.tar.bz2
                    URL_HASH SHA1=d6f324e70a42a8bbf7a5458521257225afcf0caf
                    PATCH_COMMAND ${CMAKE_COMMAND} -E copy_directory ${CMAKE_CURRENT_SOURCE_DIR}/templates ${CMAKE_CURRENT_BINARY_DIR}/mhash-0.9.9.9/src/TARGET_mhash
                    CMAKE_ARGS ${MHASH_CMAKE_ARGS}
                    INSTALL_COMMAND make install DESTDIR=${CMAKE_CURRENT_BINARY_DIR}/mhash-0.9.9.9
)


# 3) Provide all variables for the build.
SET(LIBRARY "${CMAKE_CURRENT_BINARY_DIR}/mhash-0.9.9.9/install/lib/liblibmhash.a")
SET(LDFLAGS "")
SET(DEFINES "")
SET(INCLUDE_DIRECTORIES "${CMAKE_CURRENT_BINARY_DIR}/mhash-0.9.9.9/install/include")

#----------------------------------------------------------------------------
#
# Store all information about the library in the cache.
#
SET(MHASH_LIBRARY              ${LIBRARY}              CACHE INTERNAL "The static openocd library with the complete path.")
SET(MHASH_LDFLAGS              ${LDFLAGS}              CACHE INTERNAL "All linker flags required to link the library. The list must be separated with whitespace.")
SET(MHASH_DEFINES              ${DEFINES}              CACHE INTERNAL "All defines for the openocd library. This should be a list of entries starting with -D.")
SET(MHASH_INCLUDE_DIRECTORIES  ${INCLUDE_DIRECTORIES}  CACHE INTERNAL "The include folders for the library headers. The list must be separated with whitespace.")


#----------------------------------------------------------------------------

ADD_SUBDIRECTORY(bindings)

