#!/bin/bash

SELF=$(cd `dirname $0`/..; pwd)
cd ${SELF}
mkdir -p local
cd local
if [ ! -d CLBlast ]; then
   git clone git://github.com/CNugteren/CLBlast.git
fi
pushd CLBlast
mkdir -p dist
cmake -DCMAKE_INSTALL_PREFIX=`pwd`/dist .
make -j8
make install
popd

if [ ! -d opencv ]; then
   git clone git://github.com/opencv/opencv.git
fi
pushd opencv
mkdir -p dist build
cd build
cmake -DCMAKE_INSTALL_PREFIX=`pwd`/../dist -S ..
make -j8
make install
popd

cd ${SELF}
export OPENCL_FLAGS="-framework OpenCL"
export OPENCV_DIR=${SELF}/local/opencv/dist
export CLBLAST_DIR=${SELF}/CLBlast/dist

make
