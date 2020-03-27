#!/bin/bash

source /etc/profile

localip=`ifconfig eth0|grep broadcast|awk '{print $2}'`
hostname=`hostname`

echo $localip $hostname
curl -X PUT -d '{"id": "'"$hostname"'","name": "node_exporter","address": "'"$localip"'","port": 9100,"tags": ["'"$DC"'","'"$ENV_NAME"'","'"$PROJECT_NAME"'","'"$SERVICE_NAME"'"],"EnableTagOverride": false,"checks": [{"http": "'"http://$localip:9100/"'","interval": "30s"}]}' http://zjk-consul-node:8500/v1/agent/service/register
