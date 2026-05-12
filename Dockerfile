FROM ubuntu:latest

LABEL maintainer="Valerii Udodov (https://valerii-udodov.com)"

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    apt-utils \
    sudo \
    adduser \
    hugo \
    curl \
  && rm -rf /var/lib/apt/lists/*

RUN adduser --disabled-password --gecos '' docker \
  && adduser docker sudo \
  && echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER docker

RUN curl -sL https://firebase.tools | bash

ADD deploy.sh /deploy.sh
ENTRYPOINT ["sh", "/deploy.sh"]
