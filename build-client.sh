#!/bin/sh

TOPDIR=`pwd`

sh scripts/build-libev.sh

sh scripts/build-httpress.sh
