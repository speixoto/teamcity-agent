FROM jetbrains/teamcity-agent:2020.2.2-linux-sudo

MAINTAINER Sérgio Peixoto <sergio.peixoto@gmail.com>

USER root

RUN apt-get update \
    && apt-get install -y sshpass python3-pip \
    && curl -L "https://github.com/rancher/cli/releases/download/v2.4.5/rancher-linux-amd64-v2.4.5.tar.gz" > rancher-linux.tar.gz \
    && tar -xvf rancher-linux.tar.gz \
    && mv rancher-v2.4.5/rancher /usr/local/bin/rancher \
    && curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl" \
    && chmod +x ./kubectl \
    && mv kubectl /usr/local/bin/kubectl \
    && rm -R rancher-* \
    && pip3 --no-cache-dir install --upgrade awscli awsebcli
