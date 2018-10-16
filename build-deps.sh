#!/bin/bash

set -e

pip install Cython jinja2

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
