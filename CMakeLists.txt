cmake_minimum_required(VERSION 3.7)

PROJECT("org.muhkuh.lua-mhash")


# Enable tests (see here for details: http://www.vtk.org/Wiki/CMake/Testing_With_CTest)
ENABLE_TESTING()

# Set some installation folders.
INCLUDE(cmake/muhkuh_installation_folders.cmake)

OPTION(BUILDCFG_ONLY_JONCHKI_CFG "Build only the jonchki configuration. This is used for the resolve phase. The default is OFF."
       "OFF")

# Get the VCS version for the jonchki configuration.
INCLUDE(${CMAKE_HOME_DIRECTORY}/cmake/version.cmake)

SET(PROJECT_VERSION "0.9.9.9.2")

# Write a version file.
FILE(WRITE ${CMAKE_CURRENT_BINARY_DIR}/install/mhash.version "SET(mhash_VERSION ${PROJECT_VERSION})")

# Filter the jonchki configuration.
CONFIGURE_FILE(mhash/installer/lua${BUILDCFG_LUA_VERSION}/mhash.xml
               ${CMAKE_CURRENT_BINARY_DIR}/lua${BUILDCFG_LUA_VERSION}-mhash-${PROJECT_VERSION}.xml
               @ONLY)

IF((${BUILDCFG_ONLY_JONCHKI_CFG} STREQUAL "OFF"))
	#---------------------------------------------------------------------
	#
	# Find all packages.
	#

	# Python is used for some test scripts.
	FIND_PACKAGE(PythonInterp 2.7 REQUIRED)

	# Select the LUA version.
	INCLUDE(cmake/muhkuh_lua.cmake)

	#---------------------------------------------------------------------
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


	#---------------------------------------------------------------------
	#
	# Include the projects in the subdirectories.
	#
	ADD_SUBDIRECTORY(mhash)
ENDIF((${BUILDCFG_ONLY_JONCHKI_CFG} STREQUAL "OFF"))

#----------------------------------------------------------------------------
