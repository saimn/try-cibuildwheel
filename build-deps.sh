#!/bin/bash

set -e

echo "# Installing Numpy & Cython"
pip install numpy==1.10.4 Cython

echo "# Installing cfitsio"
curl -s https://heasarc.gsfc.nasa.gov/FTP/software/fitsio/c/cfitsio3370.tar.gz | tar xvz
cd cfitsio
./configure
make shared
make install
cd ..
