#!/bin/bash

set -e

echo "# Installing Numpy"
pip install numpy==1.10.4


if [[ "$TRAVIS_OS_NAME" == "osx" ]]; then
    brew install cfitsio
    brew info cfitsio
    echo $(brew --prefix cfitsio)
else
    echo "# Downloading cfitsio"
    curl -s https://heasarc.gsfc.nasa.gov/FTP/software/fitsio/c/cfitsio3370.tar.gz | tar xz
    echo "# Installing cfitsio"
    cd cfitsio
    ./configure && make clean shared install
    cd ..
fi
