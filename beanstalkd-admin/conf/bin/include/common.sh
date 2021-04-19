#!/usr/bin/env bash
setHost() {
	_CONDITION=`cat /etc/hosts |grep "$1 $2" |wc -l`
	if [[ $_CONDITION == '0' ]]; then
		echo "$1 $2" >> /etc/hosts
	fi
}
setChownChmod() {
	APP_PATH=$1
	USER=$2
	GROUP=$3
	UNMOD=$4
	q=$(ls -al ${APP_PATH}|sed -n '2p' |awk -F " " '{print $3}')

	if [ $q == $USER ]; then
	    echo "${APP_PATH} own ${USER}"
	else
		chown -R ${USER}:${GROUP} ${APP_PATH} 
		chmod -R ${UNMOD} ${APP_PATH}/ 
	fi
}