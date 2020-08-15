FROM jetbrains/teamcity-agent:2020.1.3-linux-sudo

MAINTAINER Sérgio Peixoto <sergio.peixoto@gmail.com>

USER root

RUN curl -L "https://github.com/rancher/cli/releases/download/v2.4.5/rancher-linux-amd64-v2.4.5.tar.gz" > rancher-linux.tar.gz \
    && tar -xvf rancher-linux.tar.gz \
    && mv rancher-v2.4.5/rancher /usr/local/bin/rancher \
    && rm -R rancher-*
