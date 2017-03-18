#!/bin/sh

TOPDIR=`pwd`

SQUID=squid-3.5.24.tar.gz
SQUID_DIR=${SQUID%\.*}
SQUID_DIR=${SQUID_DIR%\.*}
SQUID_URL=http://www.squid-cache.org/Versions/v3/3.5/squid-3.5.24.tar.gz
SQUID_PATH=$TOPDIR/install

mkdir -p build
mkdir -p pkg
mkdir -p install

squid_is_install()
{
	test -f $SQUID_PATH/sbin/squid
}

if squid_is_install; then
	echo "$SQUID already installed"
	exit 0
fi

if [ ! -d build/$SQUID_DIR ]; then
	if [ ! -f pkg/$SQUID ]; then
		wget $SQUID_URL -O pkg/$SQUID
	fi
	tar xf pkg/$SQUID -C build
fi

pushd build/$SQUID_DIR

#./configure --enable-ssl --prefix=$SQUID_PATH
./configure --with-openssl --prefix=$SQUID_PATH &&
make -j`nproc` all && make install

popd

if squid_is_install; then
	if [ ! $(grep -q "squid" /etc/passwd) ]; then
		groupadd squid
		useradd -g squid squid
	fi
	chown -R squid.squid $SQUID_PATH/var
	if [ ! $(grep -q "SQUID_PATH" scripts/profile) ]; then
		echo "export SQUID_PATH=$SQUID_PATH" >> scripts/profile 
	fi

	ulimit -n 102400
	#echo 102400 > /proc/sys/fs/file-max

	echo "$SQUID installed successfully"
	exit 0
else
	echo "Failed to install $SQUID"
	exit 1
fi
