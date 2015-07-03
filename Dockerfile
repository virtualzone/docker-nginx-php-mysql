FROM virtualzone/nginx-php:latest
MAINTAINER Heiner Peuser <heiner.peuser@weweave.net>

ENV LANG C.UTF-8
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y \
    mysql-server

ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf
ADD my.cnf /etc/mysql/

RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
