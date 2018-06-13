cmake_minimum_required(VERSION 3.7)

PROJECT("org.muhkuh.lua-mhash")

# Get the VCS version for the jonchki configuration.
INCLUDE(cmake/version.cmake)
INCLUDE(cmake/platform.cmake)
MESSAGE("Building for: ${JONCHKI_PLATFORM}")

#---------------------------------------------------------------------
#
# Include the projects in the subdirectories.
#
ADD_SUBDIRECTORY(mhash)

#----------------------------------------------------------------------------
