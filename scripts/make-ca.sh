#!/bin/sh

TOPDIR=`pwd`

source scripts/profile

mkdir -p $SQUID_PATH/etc/pki/CA/private
cd $SQUID_PATH/etc/pki/CA/

openssl genrsa -out private/cakey.pem 2048
openssl req -new -x509 -key private/cakey.pem -out cacert.pem <<EOF
CN
Guangdong
Shenzhen
Huawei
Huawei
Huawei
chenzhihui4@huawei.com
EOF

cd $SQUID_PATH/etc

openssl genrsa -out squid.key 2048
openssl req -new -key squid.key -out squid.csr <<EOF
CN
Guangdong
Shenzhen
Huawei
Huawei
Huawei
chenzhihui4@huawei.com


EOF

openssl x509 -req -in squid.csr -CA $SQUID_PATH/etc/pki/CA/cacert.pem -CAkey $SQUID_PATH/etc/pki/CA/private/cakey.pem -CAcreateserial -out squid.crt
