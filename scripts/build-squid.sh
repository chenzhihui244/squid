#!/bin/sh

TOPDIR=`pwd`

SQUID=squid-3.5.24.tar.gz
SQUID_DIR=${SQUID%\.*}
SQUID_DIR=${SQUID_DIR%\.*}
SQUID_URL=http://www.squid-cache.org/Versions/v3/3.5/squid-3.5.24.tar.gz

mkdir -p build
mkdir -p pkg

squid_is_install()
{
	return 1
}

if [ ! -d build/$SQUID_DIR ]; then
	if [ ! -f pkg/$SQUID ]; then
		wget $SQUID_URL -O pkg/$SQUID
	fi
	tar xf pkg/$SQUID -C build
fi
