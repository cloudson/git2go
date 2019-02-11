#!/bin/sh

set -ex

git clone --depth 1 --single-branch git://github.com/cloudson/libgit2 libgit2 

cd libgit2
# Those files are temporary, should not be in git. To minimize 
# impact, we'll delete them now
rm -rf CMakeCache.txt CMakeFiles 

# FIXME this -G must be conditionalized 
cmake -DTHREADSAFE=ON \
      -DBUILD_CLAR=OFF \
      -G "MSYS Makefiles" \
      -DCMAKE_INSTALL_PREFIX=$PWD/install \
      .

cmake --build .

cmake --build . --target install

# make install
