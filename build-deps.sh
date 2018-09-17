#!/bin/bash

set -e

# Extra options for pip
if [ -n "$IS_OSX" ]; then
    local suffix=scipy_installers
else
    local suffix=manylinux
fi
local pip_opts="--only-binary numpy --find-links https://nipy.bic.berkeley.edu/$suffix"

echo "# Installing Numpy & Cython"
echo "pip options: $pip_opts"
pip install $pip_opts numpy==1.10.4 Cython

echo "# Installing cfitsio"
curl -s https://heasarc.gsfc.nasa.gov/FTP/software/fitsio/c/cfitsio3370.tar.gz | tar xvz
cd cfitsio
./configure && make shared && make install
cd ..
