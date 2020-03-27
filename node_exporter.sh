#!/bin/bash

docker rm -f node_exporter

docker run -d --name node_exporter -h node_exporter -v /etc/localtime:/etc/localtime \
    -v "/:/host:ro,rslave" \
    --net="host" \
    --pid="host" \
    --cap-add=SYS_TIME \
    --restart=always \
    registry-vpc.cn-zhangjiakou.aliyuncs.com/xiaoduoai/node-exporter:latest \
    --path.rootfs /host \
    --collector.tcpstat \
    --web.listen-address=":9100"
