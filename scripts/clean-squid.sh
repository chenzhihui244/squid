#!/bin/sh

source scripts/profile

rm -rf $SQUID_PATH/var/log/*
rm -rf $SQUID_PATH/var/cache/squid/*

$SQUID_PATH/sbin/squid -z
