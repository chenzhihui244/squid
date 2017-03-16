#!/bin/sh

source scripts/profile

cp conf/squid/squid.conf.reverse $SQUID_PATH/etc/squid.conf

$SQUID_PATH/sbin/squid -k shutdown
$SQUID_PATH/sbin/squid

# curl 192.168.1.211:3128
