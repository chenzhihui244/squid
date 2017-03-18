#!/bin/sh

source scripts/profile

target=${1-"localhost"}

threads=64
(( connections=threads*4 ))
(( requests=connections*4000 ))

url=https://${target}/index.html
#url=http://${target}/index.html
#url=http://localhost/index.html

httpress -n $requests -c $connections -t $threads $url
#httpress -n 200000 -c 100 -t 64 -k https://192.168.1.188/index.html
