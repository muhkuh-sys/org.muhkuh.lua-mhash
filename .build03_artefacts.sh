#! /bin/bash
set -e

#-----------------------------------------------------------------------------
#
# Build all artefacts.
#
rm -rf build
mkdir build

mkdir build/org.muhkuh.lua-lua5.1-mhash
pushd build/org.muhkuh.lua-lua5.1-mhash
cmake -DCMAKE_INSTALL_PREFIX="" ../../mhash/installer/lua5.1
make
make package
popd

mkdir build/org.muhkuh.lua-lua5.2-mhash
pushd build/org.muhkuh.lua-lua5.2-mhash
cmake -DCMAKE_INSTALL_PREFIX="" ../../mhash/installer/lua5.2
make
make package
popd

mkdir build/org.muhkuh.lua-lua5.3-mhash
pushd build/org.muhkuh.lua-lua5.3-mhash
cmake -DCMAKE_INSTALL_PREFIX="" ../../mhash/installer/lua5.3
make
make package
popd
