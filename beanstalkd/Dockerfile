FROM alpine

MAINTAINER jacklin@shouyiren.net

ENV BEANSTALKD_VERSION='1.12' \
  BEANSTALKD_DATA_PATH='/data'\
  BEANSTALKD_Z='65535' \
  BEANSTALKD_S='1048576000' \
  BEANSTALKD_PORT='11300'

RUN set -e \
&& version=$BEANSTALKD_VERSION \
# install curl (needed to install rust)
&& apk add --no-cache --virtual .build-deps curl autoconf dpkg-dev dpkg file g++ gcc libc-dev make pkgconf re2c automake libtool \
# download
&& curl -sL https://github.com/beanstalkd/beanstalkd/archive/v$version.tar.gz | tar xvz -C /tmp \
# build and install
&& cd /tmp/beanstalkd-$version \
&& make \
&& cp beanstalkd /usr/bin \
# cleanup package manager
&& apk del --no-network .build-deps \
&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 

EXPOSE 11300

COPY ./conf/bin/ /opt/docker/bin/

CMD [ "/bin/sh", "/opt/docker/bin/entrypoint.sh" ]
