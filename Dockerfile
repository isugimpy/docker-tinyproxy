###############################################################################
# Name:         Dockerfile
# Author:       Jayme Howard (forked from Daniel Middleton)
# Description:  Dockerfile used to build gimpy/tinyproxy
# Usage:        docker build -t gimpy/tinyproxy:latest .
###############################################################################

FROM alpine:latest

MAINTAINER Jayme Howard

RUN apk update \
    && apk add \
    bash \
    tinyproxy \
    logrotate

ADD logrotate.cron /etc/periodic/daily/logrotate
ADD tinyproxy.logrotate.conf /etc/logrotate.d/tinyproxy.conf

ADD run.sh /opt/docker-tinyproxy/run.sh

ENTRYPOINT ["/opt/docker-tinyproxy/run.sh"]
