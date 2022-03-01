#!/usr/bin/env bash

includeScriptDir /opt/docker/bin/include

BEANSTALKD_PORT_11300_TCP_ADDR=${BEANSTALKD_HOST}
#设置hosts
IP_HOST="127.0.0.1 beanstalkd-admin.7723.com"
setHost $IP_HOST

chown www-data:www-data /app/storage.json

BEANSTALK_SERVERS=$BEANSTALKD_PORT_11300_TCP_ADDR:${BEANSTALKD_PORT}


sed -ir "s/'servers'.*$/'servers'=> array('Default Beanstalkd' => 'beanstalk:\/\/$BEANSTALK_SERVERS'),/g" /app/config.php

if [[ $BEANSTALKD_ENABLE_AUTH == "enable" ]]; then
	sed -ir "s/'enabled'.*$/'enabled'=> 'true',/g" /app/config.php
fi
sed -ir "s/'username'.*$/'username'=> '$BEANSTALKD_AUTH_USERNAME',/g" /app/config.php
sed -ir "s/'password'.*$/'password'=> '$BEANSTALKD_AUTH_PASSWORD',/g" /app/config.php

rm -rf /app/conf

