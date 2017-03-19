#!/bin/sh

upstream=${1-"192.168.1.211"}

source scripts/profile

cp conf/squid/squid.conf.reverse $SQUID_PATH/etc/squid.conf

sed -i "s;squid_path;$SQUID_PATH;g" $SQUID_PATH/etc/squid.conf
sed -i "s/upstream/$upstream/g" $SQUID_PATH/etc/squid.conf

#if [ ! -d $SQUID_PATH/var/cache/squid/00 ]; then
#	$SQUID_PATH/sbin/squid -z
#fi

#$SQUID_PATH/sbin/squid -NX
$SQUID_PATH/sbin/squid

#ps -ef | grep "squid-\([0-9]\)" | grep -v ps | wc -l

# check squid
# curl http://192.168.1.211:3128
# curl https://192.168.1.211

#$SQUID_PATH/sbin/squid -k check # check
#$SQUID_PATH/sbin/squid -k parse # check conf file
