#!/bin/sh

source scripts/profile

cp conf/squid/squid.conf.reverse $SQUID_PATH/etc/squid.conf
$SQUID_PATH/sbin/squid

#sleep 10
#ps -ef | grep squid | grep -v ps | wc -l

# curl 192.168.1.211:3128
# install/var/logs/cache.log - start log
# install/var/logs/access.log - access log
#rm -rf $SQUID_PATH/var/cache/squid/*
#$SQUID_PATH/sbin/squid -k check # check conf file
#$SQUID_PATH/sbin/squid -z
#$SQUID_PATH/sbin/squid -k rotate
