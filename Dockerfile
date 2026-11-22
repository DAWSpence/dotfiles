FROM debian:trixie-20230612
ARG DEBIAN_FRONTEND=noninteractive

ARG WORKSPACE_DIR=/root
WORKDIR ${WORKSPACE_DIR}


RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \ 
    curl \
    git \
    wget \
    build-essential \
    openssh-client \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN mkdir -p -m 0700 ~/.ssh && ssh-keyscan github.com >> ~/.ssh/known_hosts
