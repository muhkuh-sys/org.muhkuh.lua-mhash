CMAKE_MINIMUM_REQUIRED(VERSION 3.7)

PROJECT("org.muhkuh.lua-lua52-mhash-artifact")

INCLUDE(../../../cmake/version.cmake)
INCLUDE(../../../cmake/muhkuh_version.cmake)
SET(PROJECT_VERSION ${MUHKUH_VERSION_ALL})

SET(INSTALL_WINDOWS_X86        "${CMAKE_CURRENT_SOURCE_DIR}/../../../build/lua5.2/windows_x86")
SET(INSTALL_WINDOWS_X86_64     "${CMAKE_CURRENT_SOURCE_DIR}/../../../build/lua5.2/windows_x86_64")
SET(INSTALL_UBUNTU_1204_X86    "${CMAKE_CURRENT_SOURCE_DIR}/../../../build/lua5.2/ubuntu_1204_x86")
SET(INSTALL_UBUNTU_1204_X86_64 "${CMAKE_CURRENT_SOURCE_DIR}/../../../build/lua5.2/ubuntu_1204_x86_64")
SET(INSTALL_UBUNTU_1404_X86    "${CMAKE_CURRENT_SOURCE_DIR}/../../../build/lua5.2/ubuntu_1404_x86")
SET(INSTALL_UBUNTU_1404_X86_64 "${CMAKE_CURRENT_SOURCE_DIR}/../../../build/lua5.2/ubuntu_1404_x86_64")
SET(INSTALL_UBUNTU_1604_X86    "${CMAKE_CURRENT_SOURCE_DIR}/../../../build/lua5.2/ubuntu_1604_x86")
SET(INSTALL_UBUNTU_1604_X86_64 "${CMAKE_CURRENT_SOURCE_DIR}/../../../build/lua5.2/ubuntu_1604_x86_64")
SET(INSTALL_UBUNTU_1610_X86    "${CMAKE_CURRENT_SOURCE_DIR}/../../../build/lua5.2/ubuntu_1610_x86")
SET(INSTALL_UBUNTU_1610_X86_64 "${CMAKE_CURRENT_SOURCE_DIR}/../../../build/lua5.2/ubuntu_1610_x86_64")


SET(CPACK_OUTPUT_FILE_PREFIX targets/jonchki/repository/org/muhkuh/lua/mhash/${PROJECT_VERSION})
SET(CPACK_INCLUDE_TOPLEVEL_DIRECTORY FALSE)
SET(CPACK_PACKAGE_FILE_NAME "lua5.2-mhash-${PROJECT_VERSION}")

SET(CPACK_GENERATOR "ZIP")
INCLUDE(CPack)


#-----------------------------------------------------------------------------
#
# Install the 32bit files.
#
INSTALL(FILES ${INSTALL_WINDOWS_X86}/lua_plugins/mhash.dll
        DESTINATION windows_x86/lua_plugins)

INSTALL(FILES ${INSTALL_UBUNTU_1204_X86}/lua_plugins/mhash.so
        DESTINATION ubuntu_1204_x86/lua_plugins)

INSTALL(FILES ${INSTALL_UBUNTU_1404_X86}/lua_plugins/mhash.so
        DESTINATION ubuntu_1404_x86/lua_plugins)

INSTALL(FILES ${INSTALL_UBUNTU_1604_X86}/lua_plugins/mhash.so
        DESTINATION ubuntu_1604_x86/lua_plugins)

INSTALL(FILES ${INSTALL_UBUNTU_1610_X86}/lua_plugins/mhash.so
        DESTINATION ubuntu_1610_x86/lua_plugins)


#-----------------------------------------------------------------------------
#
# Install the 64bit files.
#
INSTALL(FILES ${INSTALL_WINDOWS_X86_64}/lua_plugins/mhash.dll
        DESTINATION windows_x86_64/lua_plugins)

INSTALL(FILES ${INSTALL_UBUNTU_1204_X86_64}/lua_plugins/mhash.so
        DESTINATION ubuntu_1204_x86_64/lua_plugins)

INSTALL(FILES ${INSTALL_UBUNTU_1404_X86_64}/lua_plugins/mhash.so
        DESTINATION ubuntu_1404_x86_64/lua_plugins)

INSTALL(FILES ${INSTALL_UBUNTU_1604_X86_64}/lua_plugins/mhash.so
        DESTINATION ubuntu_1604_x86_64/lua_plugins)

INSTALL(FILES ${INSTALL_UBUNTU_1610_X86_64}/lua_plugins/mhash.so
        DESTINATION ubuntu_1610_x86_64/lua_plugins)

#-----------------------------------------------------------------------------

INSTALL(FILES install.lua
        DESTINATION .)

CONFIGURE_FILE(mhash.xml
               ${CPACK_OUTPUT_FILE_PREFIX}/lua5.2-mhash-${PROJECT_VERSION}.xml
               @ONLY)
