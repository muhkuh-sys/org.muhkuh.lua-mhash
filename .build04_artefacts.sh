#! /bin/bash
set -e

#-----------------------------------------------------------------------------
#
# Build all artefacts.
#
pushd build
rm -rf org.muhkuh.lua-lua5.1-mhash
rm -rf org.muhkuh.lua-lua5.2-mhash
rm -rf org.muhkuh.lua-lua5.3-mhash
rm -rf lua5.1
rm -rf lua5.2
rm -rf lua5.3

mkdir org.muhkuh.lua-lua5.1-mhash
mkdir org.muhkuh.lua-lua5.2-mhash
mkdir org.muhkuh.lua-lua5.3-mhash
mkdir -p lua5.1/windows_x86
mkdir -p lua5.1/windows_x86_64
mkdir -p lua5.1/ubuntu_1204_x86
mkdir -p lua5.1/ubuntu_1204_x86_64
mkdir -p lua5.1/ubuntu_1404_x86
mkdir -p lua5.1/ubuntu_1404_x86_64
mkdir -p lua5.1/ubuntu_1604_x86
mkdir -p lua5.1/ubuntu_1604_x86_64
mkdir -p lua5.1/ubuntu_1610_x86
mkdir -p lua5.1/ubuntu_1610_x86_64
mkdir -p lua5.2/windows_x86
mkdir -p lua5.2/windows_x86_64
mkdir -p lua5.2/ubuntu_1204_x86
mkdir -p lua5.2/ubuntu_1204_x86_64
mkdir -p lua5.2/ubuntu_1404_x86
mkdir -p lua5.2/ubuntu_1404_x86_64
mkdir -p lua5.2/ubuntu_1604_x86
mkdir -p lua5.2/ubuntu_1604_x86_64
mkdir -p lua5.2/ubuntu_1610_x86
mkdir -p lua5.2/ubuntu_1610_x86_64
mkdir -p lua5.3/windows_x86
mkdir -p lua5.3/windows_x86_64
mkdir -p lua5.3/ubuntu_1204_x86
mkdir -p lua5.3/ubuntu_1204_x86_64
mkdir -p lua5.3/ubuntu_1404_x86
mkdir -p lua5.3/ubuntu_1404_x86_64
mkdir -p lua5.3/ubuntu_1604_x86
mkdir -p lua5.3/ubuntu_1604_x86_64
mkdir -p lua5.3/ubuntu_1610_x86
mkdir -p lua5.3/ubuntu_1610_x86_64



tar --extract --directory lua5.1/windows_x86 --file build_lua5.1_windows_x86.tar.gz --gzip
tar --extract --directory lua5.2/windows_x86 --file build_lua5.2_windows_x86.tar.gz --gzip
tar --extract --directory lua5.3/windows_x86 --file build_lua5.3_windows_x86.tar.gz --gzip

tar --extract --directory lua5.1/windows_x86_64 --file build_lua5.1_windows_x86_64.tar.gz --gzip
tar --extract --directory lua5.2/windows_x86_64 --file build_lua5.2_windows_x86_64.tar.gz --gzip
tar --extract --directory lua5.3/windows_x86_64 --file build_lua5.3_windows_x86_64.tar.gz --gzip

tar --extract --directory lua5.1/ubuntu_1204_x86 --file build_lua5.1_ubuntu_1204_x86.tar.gz --gzip
tar --extract --directory lua5.2/ubuntu_1204_x86 --file build_lua5.2_ubuntu_1204_x86.tar.gz --gzip
tar --extract --directory lua5.3/ubuntu_1204_x86 --file build_lua5.3_ubuntu_1204_x86.tar.gz --gzip

tar --extract --directory lua5.1/ubuntu_1204_x86_64 --file build_lua5.1_ubuntu_1204_x86_64.tar.gz --gzip
tar --extract --directory lua5.2/ubuntu_1204_x86_64 --file build_lua5.2_ubuntu_1204_x86_64.tar.gz --gzip
tar --extract --directory lua5.3/ubuntu_1204_x86_64 --file build_lua5.3_ubuntu_1204_x86_64.tar.gz --gzip

tar --extract --directory lua5.1/ubuntu_1404_x86 --file build_lua5.1_ubuntu_1404_x86.tar.gz --gzip
tar --extract --directory lua5.2/ubuntu_1404_x86 --file build_lua5.2_ubuntu_1404_x86.tar.gz --gzip
tar --extract --directory lua5.3/ubuntu_1404_x86 --file build_lua5.3_ubuntu_1404_x86.tar.gz --gzip

tar --extract --directory lua5.1/ubuntu_1404_x86_64 --file build_lua5.1_ubuntu_1404_x86_64.tar.gz --gzip
tar --extract --directory lua5.2/ubuntu_1404_x86_64 --file build_lua5.2_ubuntu_1404_x86_64.tar.gz --gzip
tar --extract --directory lua5.3/ubuntu_1404_x86_64 --file build_lua5.3_ubuntu_1404_x86_64.tar.gz --gzip

tar --extract --directory lua5.1/ubuntu_1604_x86 --file build_lua5.1_ubuntu_1604_x86.tar.gz --gzip
tar --extract --directory lua5.2/ubuntu_1604_x86 --file build_lua5.2_ubuntu_1604_x86.tar.gz --gzip
tar --extract --directory lua5.3/ubuntu_1604_x86 --file build_lua5.3_ubuntu_1604_x86.tar.gz --gzip

tar --extract --directory lua5.1/ubuntu_1604_x86_64 --file build_lua5.1_ubuntu_1604_x86_64.tar.gz --gzip
tar --extract --directory lua5.2/ubuntu_1604_x86_64 --file build_lua5.2_ubuntu_1604_x86_64.tar.gz --gzip
tar --extract --directory lua5.3/ubuntu_1604_x86_64 --file build_lua5.3_ubuntu_1604_x86_64.tar.gz --gzip

tar --extract --directory lua5.1/ubuntu_1610_x86 --file build_lua5.1_ubuntu_1610_x86.tar.gz --gzip
tar --extract --directory lua5.2/ubuntu_1610_x86 --file build_lua5.2_ubuntu_1610_x86.tar.gz --gzip
tar --extract --directory lua5.3/ubuntu_1610_x86 --file build_lua5.3_ubuntu_1610_x86.tar.gz --gzip

tar --extract --directory lua5.1/ubuntu_1610_x86_64 --file build_lua5.1_ubuntu_1610_x86_64.tar.gz --gzip
tar --extract --directory lua5.2/ubuntu_1610_x86_64 --file build_lua5.2_ubuntu_1610_x86_64.tar.gz --gzip
tar --extract --directory lua5.3/ubuntu_1610_x86_64 --file build_lua5.3_ubuntu_1610_x86_64.tar.gz --gzip

popd


pushd build/org.muhkuh.lua-lua5.1-mhash
cmake -DCMAKE_INSTALL_PREFIX="" ../../mhash/installer/lua5.1
make
make package
python2.7 ../../cmake/tools/generate_hash.py targets/jonchki/repository/org/muhkuh/lua/mhash/*/lua5.1-mhash-*.xml
python2.7 ../../cmake/tools/generate_hash.py targets/jonchki/repository/org/muhkuh/lua/mhash/*/lua5.1-mhash-*.tar.xz
popd

pushd build/org.muhkuh.lua-lua5.2-mhash
cmake -DCMAKE_INSTALL_PREFIX="" ../../mhash/installer/lua5.2
make
make package
python2.7 ../../cmake/tools/generate_hash.py targets/jonchki/repository/org/muhkuh/lua/mhash/*/lua5.2-mhash-*.xml
python2.7 ../../cmake/tools/generate_hash.py targets/jonchki/repository/org/muhkuh/lua/mhash/*/lua5.2-mhash-*.tar.xz
popd

pushd build/org.muhkuh.lua-lua5.3-mhash
cmake -DCMAKE_INSTALL_PREFIX="" ../../mhash/installer/lua5.3
make
make package
python2.7 ../../cmake/tools/generate_hash.py targets/jonchki/repository/org/muhkuh/lua/mhash/*/lua5.3-mhash-*.xml
python2.7 ../../cmake/tools/generate_hash.py targets/jonchki/repository/org/muhkuh/lua/mhash/*/lua5.3-mhash-*.tar.xz
popd
