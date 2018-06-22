#!/bin/bash


/usr/local/bin/cgminer -o "${POOL_URL}" -u ${MINER_USER}  -p ${MINER_PASSWD}  >>/var/log/cgminer.log 2>&1
