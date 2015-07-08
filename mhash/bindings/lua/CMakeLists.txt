CMAKE_MINIMUM_REQUIRED(VERSION 2.8)

PROJECT("module_mhash_lua")

FIND_PACKAGE(SWIG REQUIRED)
INCLUDE(${SWIG_USE_FILE})

# Windows builds use the Muhkuh LUA package. Linux builds use the system LUA package.
IF((${CMAKE_SYSTEM_NAME} STREQUAL "Windows"))
	FIND_PACKAGE(org.muhkuh.lua-lua51 REQUIRED)
ELSE((${CMAKE_SYSTEM_NAME} STREQUAL "Windows"))
	FIND_PACKAGE(Lua51 REQUIRED)
	INCLUDE_DIRECTORIES(${LUA_INCLUDE_DIR})
ENDIF((${CMAKE_SYSTEM_NAME} STREQUAL "Windows"))

INCLUDE_DIRECTORIES(${CMAKE_CURRENT_SOURCE_DIR})
INCLUDE_DIRECTORIES(${MHASH_INCLUDE_DIRECTORIES})

# Build the Lua module.
SET_SOURCE_FILES_PROPERTIES(../mhash.i PROPERTIES CPLUSPLUS ON)
SET_SOURCE_FILES_PROPERTIES(../mhash.i PROPERTIES SWIG_FLAGS "-I${CMAKE_CURRENT_SOURCE_DIR} -I${MHASH_INCLUDE_DIRECTORIES}")
SWIG_ADD_MODULE(TARGET_module_mhash_lua lua ../mhash.i mhash_state.cpp)
IF((${CMAKE_SYSTEM_NAME} STREQUAL "Windows"))
	SWIG_LINK_LIBRARIES(TARGET_module_mhash_lua org.muhkuh.lua-lua51::TARGET_lualib)
ELSE((${CMAKE_SYSTEM_NAME} STREQUAL "Windows"))
	SWIG_LINK_LIBRARIES(TARGET_module_mhash_lua ${LUA_LIBRARIES} ${MHASH_LIBRARY})
ENDIF((${CMAKE_SYSTEM_NAME} STREQUAL "Windows"))

# The module depends on the mhash library.
ADD_DEPENDENCIES(TARGET_module_mhash_lua TARGET_mhash)

# Set the name of the output file to "mhash".
SET_TARGET_PROPERTIES(TARGET_module_mhash_lua PROPERTIES PREFIX "" OUTPUT_NAME "mhash")

# On mingw link all compiler libraries static.
IF((${CMAKE_SYSTEM_NAME} STREQUAL "Windows") AND (${CMAKE_COMPILER_IS_GNUCC}))
	SET_PROPERTY(TARGET TARGET_module_mhash_lua PROPERTY LINK_FLAGS "-static -static-libgcc -static-libstdc++")
ENDIF((${CMAKE_SYSTEM_NAME} STREQUAL "Windows") AND (${CMAKE_COMPILER_IS_GNUCC}))

# Install the lua module.
INSTALL(TARGETS TARGET_module_mhash_lua DESTINATION ${INSTALL_DIR_LUA_MODULES})

# Add tests for this module.
IF((${CMAKE_SYSTEM_NAME} STREQUAL "Windows") AND (${CMAKE_COMPILER_IS_GNUCC}))
	# Here are the MinGW specific tests.
	ADD_TEST(NAME mhash_MinGW_DLL_dependencies
	         COMMAND "${PYTHON_EXECUTABLE}" ${CMAKE_HOME_DIRECTORY}/cmake/tests/mingw_dll_dependencies.py -u liblua $<TARGET_FILE:TARGET_module_mhash_lua>)
ENDIF((${CMAKE_SYSTEM_NAME} STREQUAL "Windows") AND (${CMAKE_COMPILER_IS_GNUCC}))
