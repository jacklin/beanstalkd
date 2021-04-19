FROM jacklin/php:7.1.2-fpm-nginx-alpine

MAINTAINER jacklin@shouyiren.net

ENV ENV=remote \
    WEB_SERVER_NAME="beanstalkd-admin.7723.com" \
    WEB_SERVER_PORT='2080' \
    WEB_DOCUMENT_ROOT=/app/public \
    SSL_CERTIFICATE=/app/.ssl/common.crt \
    SSL_CERTIFICATE_KEY=/app/.ssl/common.pem \
    BEANSTALKD_HOST="127.0.0.1" \
    BEANSTALKD_PORT="11300" \
    BEANSTALKD_ENABLE_AUTH='enable' \
    BEANSTALKD_AUTH_USERNAME='admin' \
    BEANSTALKD_AUTH_PASSWORD='admin'

WORKDIR /app

# exit if a command fails
RUN set -e \
# download
&& curl -sL https://github.com/ptrofimov/beanstalk_console/archive/refs/tags/1.7.11.tar.gz | tar xvz -C /tmp \
&& mv /tmp/beanstalk_console-1.7.11/* /app/ \
# remove tmp files
&& rm -rf /tmp/* 

COPY  ./ .

COPY conf/ /opt/docker/

EXPOSE 2080

