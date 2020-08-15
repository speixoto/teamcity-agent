FROM jetbrains/teamcity-minimal-agent:2017.2

MAINTAINER Sérgio Peixoto <sergio.peixoto@gmail.com>

RUN apt-get update \
    && apt-get install -y git mercurial openjdk-8-jdk apt-transport-https ca-certificates \
    && apt-get install -y docker.io \
    && curl -L "https://github.com/docker/compose/releases/download/1.8.1/docker-compose-$(uname -s)-$(uname -m)" > /usr/local/bin/docker-compose \
    && curl -L "https://github.com/rancher/rancher-compose/releases/download/v0.12.5/rancher-compose-linux-amd64-v0.12.5.tar.gz" > rancher-compose.tar.gz \
    && curl -L "https://github.com/rancher/cli/releases/download/v0.5.3/rancher-linux-amd64-v0.5.3.tar.gz" > rancher-cli.tar.gz \
    && tar -xvf rancher-compose.tar.gz \
    && mv rancher-compose-v0.12.5/rancher-compose /usr/local/bin/rancher-compose \
    && rm -R rancher-compose-* \
    && tar -xvf rancher-cli.tar.gz \
    && mv rancher-v0.5.3/rancher /usr/local/bin/rancher \
    && rm -R rancher-* \
    && chmod +x /usr/local/bin/docker-compose \
    && apt-get clean all \
    && usermod -aG docker buildagent

COPY run-docker.sh /services/run-docker.sh
