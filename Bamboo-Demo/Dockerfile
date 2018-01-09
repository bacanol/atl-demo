FROM openjdk:8-jdk-alpine
MAINTAINER Nico Hoffmann

ENV RUN_USER            daemon
ENV RUN_GROUP           daemon

# Setup useful environment variables
ENV BAMBOO_HOME     /var/atlassian/bamboo
ENV BAMBOO_INSTALL_DIR  /opt/atlassian/bamboo

VOLUME ["${BAMBOO_HOME}"]

# Expose HTTP and SSH ports
EXPOSE 8085
EXPOSE 54663

WORKDIR $BAMBOO_HOME

CMD ["/entrypoint.sh", "-fg"]
ENTRYPOINT ["/sbin/tini", "--"]

RUN apk update -qq \
    && update-ca-certificates \
    && apk add ca-certificates wget curl git git-daemon openssh bash procps openssl perl ttf-dejavu tini
RUN    apk add maven apache-ant nodejs \
    && rm -rf /var/lib/{apt,dpkg,cache,log}/ /tmp/* /var/tmp/*

COPY entrypoint.sh              /entrypoint.sh

ARG BAMBOO_VERSION=6.3.0
#ARG DOWNLOAD_URL=https://downloads.atlassian.com/software/bamboo/downloads/atlassian-bamboo-${BAMBOO_VERSION}.tar.gz
ARG DOWNLOAD_URL=http://10.0.8.38:6080/source/atlassian-bamboo-${BAMBOO_VERSION}.tar.gz
COPY . /tmp

RUN mkdir -p                             ${BAMBOO_INSTALL_DIR} \
    && curl -L --silent                  ${DOWNLOAD_URL} | tar -xz --strip-components=1 -C "$BAMBOO_INSTALL_DIR" 
ADD server.xml "${BAMBOO_INSTALL_DIR}/conf/server.xml"
RUN chown -R ${RUN_USER}:${RUN_GROUP} ${BAMBOO_INSTALL_DIR}/ \
    && chown -R ${RUN_USER}:${RUN_GROUP} /sbin/tini
