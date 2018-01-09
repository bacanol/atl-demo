FROM openjdk:8-jdk-alpine
MAINTAINER Nico Hoffmann

ENV RUN_USER            daemon
ENV RUN_GROUP           daemon

# https://confluence.atlassian.com/display/BitbucketServer/Bitbucket+Server+home+directory
ENV BITBUCKET_HOME          /var/atlassian/application-data/bitbucket
ENV BITBUCKET_INSTALL_DIR   /opt/atlassian/bitbucket

VOLUME ["${BITBUCKET_HOME}"]

# Expose HTTP and SSH ports
EXPOSE 7990
EXPOSE 7999

WORKDIR $BITBUCKET_HOME

CMD ["/entrypoint.sh", "-fg"]
ENTRYPOINT ["/sbin/tini", "--"]

RUN apk update -qq \
    && update-ca-certificates \
    && apk add ca-certificates wget curl git git-daemon openssh bash procps openssl perl ttf-dejavu tini 
RUN apk add gzip tar \
    && rm -rf /var/lib/{apt,dpkg,cache,log}/ /tmp/* /var/tmp/*

COPY entrypoint.sh              /entrypoint.sh

ARG BITBUCKET_VERSION=5.6.2
#ARG DOWNLOAD_URL=https://downloads.atlassian.com/software/stash/downloads/atlassian-bitbucket-${BITBUCKET_VERSION}.tar.gz
ARG DOWNLOAD_URL=http://10.0.8.38:6080/source/atlassian-bitbucket-${BITBUCKET_VERSION}.tar.gz
COPY . /tmp

RUN mkdir -p                             ${BITBUCKET_INSTALL_DIR} 
RUN curl -Ls                             ${DOWNLOAD_URL} | tar -xz --strip-components=1 --no-same-owner --directory "$BITBUCKET_INSTALL_DIR" 
RUN chown -R ${RUN_USER}:${RUN_GROUP}    ${BITBUCKET_INSTALL_DIR}/
