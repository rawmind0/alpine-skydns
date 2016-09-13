#!/usr/bin/env bash

cat << EOF > ${SERVICE_CONF}
export ETCD_MACHINES=${ETCD_MACHINES:-"http://etcd:2379"}
export SKYDNS_ADDR=${SKYDNS_ADDR:-"0.0.0.0:5353"}
export SKYDNS_DOMAIN=${SKYDNS_DOMAIN:-"dev.local"}
export SKYDNS_PATH_PREFIX=${SKYDNS_PATH_PREFIX:-"skydns"}
export SKYDNS_NDOTS=${SKYDNS_NDOTS:-"1"}
export SKYDNS_NO_REC=${SKYDNS_NO_REC:-"true"}
if [ "${SKYDNS_NO_REC}" == "true" ]; then
	export SKYDNS_NAMESERVERS=${SKYDNS_NAMESERVERS:-""} 
else
   	export SKYDNS_NAMESERVERS=${SKYDNS_NAMESERVERS:-"8.8.8.8:53,8.8.4.4:53"} 
fi
EOF
