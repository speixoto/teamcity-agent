FROM jetbrains/teamcity-minimal-agent:latest

MAINTAINER Sérgio Peixoto <sergio.peixoto@gmail.com>

RUN apt-get update \
    && apt-get install -y git mercurial openjdk-8-jdk apt-transport-https ca-certificates \
    && apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D \
    && echo "deb https://apt.dockerproject.org/repo ubuntu-wily main" > /etc/apt/sources.list.d/docker.list \
    && apt-cache policy docker-engine \
    && apt-get update \
    && apt-get install -y docker-engine=1.12.3-0~wily \
    && curl -L "https://github.com/docker/compose/releases/download/1.8.1/docker-compose-$(uname -s)-$(uname -m)" > /usr/local/bin/docker-compose \
    && curl -L "https://github.com/rancher/rancher-compose/releases/download/v0.12.2/rancher-compose-linux-amd64-v0.12.2.tar.gz" > rancher-compose.tar.gz \
    && curl -L "https://github.com/rancher/cli/releases/download/v0.4.1/rancher-linux-amd64-v0.4.1.tar.gz" > rancher-cli.tar.gz \
    && tar -xvf rancher-compose.tar.gz \
    && mv rancher-compose-v0.12.2/rancher-compose /usr/local/bin/rancher-compose \
    && rm -R rancher-compose-* \
    && tar -xvf rancher-cli.tar.gz \
    && mv rancher-v0.4.1/rancher /usr/local/bin/rancher \
    && rm -R rancher-* \
    && chmod +x /usr/local/bin/docker-compose \
    && apt-get clean all \
    && usermod -aG docker buildagent

COPY run-docker.sh /services/run-docker.sh
