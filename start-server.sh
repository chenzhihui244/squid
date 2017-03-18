#!/bin/sh

TOPDIR=`pwd`

sh scripts/stop-squid.sh
sleep 1
#sh scripts/clean-squid.sh
sh scripts/start-squid.sh
