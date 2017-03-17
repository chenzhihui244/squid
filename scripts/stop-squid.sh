#!/bin/sh

source scripts/profile

$SQUID_PATH/sbin/squid -k shutdown

true
while [ $? -eq 0 ]; do
	echo "squid still running"
	ps -ef | grep squid | grep -v ps | wc -l
	$SQUID_PATH/sbin/squid -k check
done
