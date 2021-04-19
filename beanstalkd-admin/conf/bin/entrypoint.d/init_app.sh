#!/usr/bin/env bash

includeScriptDir /opt/docker/bin/include

BEANSTALKD_PORT_11300_TCP_ADDR=${BEANSTALKD_HOST}
#设置hosts
IP_HOST="127.0.0.1 beanstalkd-admin.7723.com"
setHost $IP_HOST

chown www-data:www-data /app/storage.json

BEANSTALK_SERVERS=$BEANSTALKD_PORT_11300_TCP_ADDR:${BEANSTALKD_PORT}

