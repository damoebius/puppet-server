FROM ubuntu:bionic
LABEL maintainer="damoebius"

RUN \
 echo "**** install packages ****" && \
 apt-get update && \
 apt-get install -y \
        puppet-master && \
 echo "**** cleanup ****" && \
 apt-get clean && \
 rm -rf \
        /tmp/* \
        /var/lib/apt/lists/* \
        /var/tmp/*

ENV PUPPETSERVER_JAVA_ARGS="-Xms512m -Xmx512m"

EXPOSE 8141

CMD service puppet-master start && tail -f /var/log/puppet/masterhttp.log
