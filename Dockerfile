# BitTorrentSync
#
# VERSION 0.0.1

FROM ubuntu:latest
MAINTAINER  jia <jia.tian@me.com>
LABEL com.getsync.version="2.3.7"

RUN sed -i -- 's/archive.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list
RUN apt update && \
    apt upgrade -y && \
    apt install curl -y

RUN curl -o /tmp/sync.tgz https://download-cdn.getsync.com/2.3.7/linux-x64/BitTorrent-Sync_x64.tar.gz 
RUN tar -xf /tmp/sync.tgz -C /usr/sbin btsync && rm -f /tmp/sync.tgz

COPY btsync.conf /etc/
RUN mkdir /data && mkdir /config

EXPOSE 8888
EXPOSE 55555

VOLUME /data
VOLUME /config

ENTRYPOINT ["/usr/sbin/btsync", "--log", "--config", "/etc/btsync.conf", "--nodaemon"]