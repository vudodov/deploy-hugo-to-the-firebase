FROM ubuntu:latest

LABEL maintainer="Valerii Udodov (https://valerii-udodov.com)"

# getting sudo permissions
RUN apt-get update &&\
apt-get install -y --no-install-recommends apt-utils sudp

RUN apt-get update \
 && apt-get install -y sudo

RUN adduser --disabled-password --gecos '' docker
RUN adduser docker sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER docker

RUN sudo apt-get update

# Installing hugo and firebase
RUN sudo apt-get install -y hugo curl
RUN curl -sL https://firebase.tools | bash

# Build website
RUN hugo

ADD deploy.sh /deploy.sh
ENTRYPOINT ["sh", "/deploy.sh"]
