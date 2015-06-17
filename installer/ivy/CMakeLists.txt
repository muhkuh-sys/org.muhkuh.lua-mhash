cmake_minimum_required(VERSION 2.8)

PROJECT("org.muhkuh.lua-mhash")

INCLUDE(ExternalProject)


GET_FILENAME_COMPONENT(MUHKUH_WIN32_INSTALL "../../build_windows32/install" ABSOLUTE)
GET_FILENAME_COMPONENT(MUHKUH_WIN64_INSTALL "../../build_windows64/install" ABSOLUTE)

# The version number is a combination of the LUA version and the packaging.
# The major and minor numbers are taken from the LUA version, i.e. LUA 5.1.5
# results in the package version 5.1 . LUA version 5.2.4 results in the
# package version 5.2 .
# The patch version of the package indicates...
#  1) updates of the LUA source in the same major and minor, e.g. 5.1.4 -> 5.1.5
#  2) updates of the packaging
#
SET(CPACK_PACKAGE_VERSION_MAJOR 0)
SET(CPACK_PACKAGE_VERSION_MINOR 9)
SET(CPACK_PACKAGE_VERSION_PATCH 0)
SET(VERSION_FULL ${CPACK_PACKAGE_VERSION_MAJOR}.${CPACK_PACKAGE_VERSION_MINOR}.${CPACK_PACKAGE_VERSION_PATCH})


SET(PACKAGE_CMAKE_ARGS "")
LIST(APPEND PACKAGE_CMAKE_ARGS "-DMUHKUH_WIN32_INSTALL=${MUHKUH_WIN32_INSTALL}")
LIST(APPEND PACKAGE_CMAKE_ARGS "-DMUHKUH_WIN64_INSTALL=${MUHKUH_WIN64_INSTALL}")
LIST(APPEND PACKAGE_CMAKE_ARGS "-DCPACK_PACKAGE_VERSION_MAJOR=${CPACK_PACKAGE_VERSION_MAJOR}")
LIST(APPEND PACKAGE_CMAKE_ARGS "-DCPACK_PACKAGE_VERSION_MINOR=${CPACK_PACKAGE_VERSION_MINOR}")
LIST(APPEND PACKAGE_CMAKE_ARGS "-DCPACK_PACKAGE_VERSION_PATCH=${CPACK_PACKAGE_VERSION_PATCH}")
LIST(APPEND PACKAGE_CMAKE_ARGS "-DVERSION_FULL=${VERSION_FULL}")
LIST(APPEND PACKAGE_CMAKE_ARGS "-DARTIFACT_LISTS_OUTPUT=${CMAKE_CURRENT_BINARY_DIR}/artifacts")

ExternalProject_Add(TARGET_mhash
                    SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/mhash
                    CMAKE_ARGS ${PACKAGE_CMAKE_ARGS}
                    INSTALL_COMMAND make package
)

# Create a copy of the artifacts without a version number in the filename.
# This allows easy deploy to GitHub.
INSTALL(FILES ${CMAKE_CURRENT_BINARY_DIR}/TARGET_mhash-prefix/src/TARGET_mhash-build/lua51-mhash-${CPACK_PACKAGE_VERSION_MAJOR}.${CPACK_PACKAGE_VERSION_MINOR}.${CPACK_PACKAGE_VERSION_PATCH}.zip
        DESTINATION ${CMAKE_CURRENT_BINARY_DIR}
        RENAME lua51-mhash.zip)
INSTALL(FILES ${CMAKE_CURRENT_BINARY_DIR}/TARGET_mhash-prefix/src/TARGET_mhash-build/ivy-${CPACK_PACKAGE_VERSION_MAJOR}.${CPACK_PACKAGE_VERSION_MINOR}.${CPACK_PACKAGE_VERSION_PATCH}.xml
        DESTINATION ${CMAKE_CURRENT_BINARY_DIR}
        RENAME ivy.xml)

#----------------------------------------------------------------------------

