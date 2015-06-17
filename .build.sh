#! /bin/sh

# Get this from somewhere.
LUA_LIBRARIES_X86_64=`pwd`/lua/windows_amd64/dev/lib/liblua.dll.a
LUA_LIBRARIES_X86=`pwd`/lua/windows_x86/dev/lib/liblua.dll.a


#-----------------------------------------------------------------------------
#
# Build the windows32 version.
#
rm -rf build_windows32
mkdir build_windows32
cd build_windows32

cmake -DCMAKE_INSTALL_PREFIX="" -DCMAKE_C_FLAGS=-m32 -DCMAKE_CXX_FLAGS=-m32 -DCMAKE_SYSTEM_NAME=Windows -DCMAKE_C_COMPILER=i686-w64-mingw32-gcc -DCMAKE_CXX_COMPILER=i686-w64-mingw32-g++ -DCMAKE_RC_COMPILER=i686-w64-mingw32-windres -DLUA_LIBRARIES=${LUA_LIBRARIES_X86} ..
STATUS=$?
if [ $STATUS -ne 0 ]; then
	exit 1
fi

make
STATUS=$?
if [ $STATUS -ne 0 ]; then
	exit 1
fi

make test
STATUS=$?
if [ $STATUS -ne 0 ]; then
	exit 1
fi

make install DESTDIR=`pwd`/install
STATUS=$?
if [ $STATUS -ne 0 ]; then
	exit 1
fi

cd ..


#-----------------------------------------------------------------------------
#
# Build the windows64 version.
#
rm -rf build_windows64
mkdir build_windows64
cd build_windows64

cmake -DCMAKE_INSTALL_PREFIX="" -DCMAKE_C_FLAGS=-m64 -DCMAKE_CXX_FLAGS=-m64 -DCMAKE_SYSTEM_NAME=Windows -DCMAKE_C_COMPILER=x86_64-w64-mingw32-gcc -DCMAKE_CXX_COMPILER=x86_64-w64-mingw32-g++ -DCMAKE_RC_COMPILER=x86_64-w64-mingw32-windres -DLUA_LIBRARIES=${LUA_LIBRARIES_X86_64} ..
STATUS=$?
if [ $STATUS -ne 0 ]; then
	exit 1
fi

make
STATUS=$?
if [ $STATUS -ne 0 ]; then
	exit 1
fi

make test
STATUS=$?
if [ $STATUS -ne 0 ]; then
	exit 1
fi

make install DESTDIR=`pwd`/install
STATUS=$?
if [ $STATUS -ne 0 ]; then
	exit 1
fi

cd ..


#-----------------------------------------------------------------------------
#
# Assemble the artifacts.
#
#rm -rf build
#mkdir build
#cd build
#cmake ../installer/ivy
#STATUS=$?
#if [ $STATUS -ne 0 ]; then
#	exit 1
#fi
#
#make
#STATUS=$?
#if [ $STATUS -ne 0 ]; then
#	exit 1
#fi
#
#make install
#STATUS=$?
#if [ $STATUS -ne 0 ]; then
#	exit 1
#fi
#
#cd ..

