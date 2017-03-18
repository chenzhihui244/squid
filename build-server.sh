#!/bin/sh

TOPDIR=${0%/*}
cd $TOPDIR

sh scripts/build-squid.sh
sh scripts/make-ca.sh

