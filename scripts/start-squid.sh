#!/bin/sh

upstream="192.168.1.211"

source scripts/profile

cp conf/squid/squid.conf.reverse $SQUID_PATH/etc/squid.conf

sed -i "s;squid_path;$SQUID_PATH;g" $SQUID_PATH/etc/squid.conf
sed -i "s/upstream/$upstream/g" $SQUID_PATH/etc/squid.conf

if [ ! -d $SQUID_PATH/var/cache/squid/00 ]; then
	$SQUID_PATH/sbin/squid -z
fi

#$SQUID_PATH/sbin/squid -NX
$SQUID_PATH/sbin/squid

#sleep 10
#ps -ef | grep squid | grep -v ps | wc -l

# check squid
# curl 192.168.1.211:3128

#$SQUID_PATH/sbin/squid -k check # check conf file
#$SQUID_PATH/sbin/squid -k rotate
