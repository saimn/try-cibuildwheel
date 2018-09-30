#!/bin/bash

set -e

echo "# Installing Numpy"
pyversion=$(python -c 'import sys; print("%d.%d" % (sys.version_info.major, sys.version_info.minor))')
case "$pyversion" in 
  3.5)
    pip install numpy==1.10.4
    ;;
  3.6)
    pip install numpy==1.11.3
    ;;
  3.7)
    pip install numpy==1.14.5
    ;;
esac

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
