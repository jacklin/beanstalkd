#!/usr/bin/env bash

if [[ ! -d ${BEANSTALKD_DATA_PATH} ]]; then
	mkdir -p ${BEANSTALKD_DATA_PATH}
fi
if [[ ! -d "${BEANSTALKD_DATA_PATH}/${HOSTNAME}" ]]; then
	mkdir -p ${BEANSTALKD_DATA_PATH}/${HOSTNAME}
fi

BEANSTALKD_DATA_PATH=${BEANSTALKD_DATA_PATH}/${HOSTNAME}
