FROM ubuntu:20.04

# Install system tools
RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update && \
    apt-get install -y --no-install-recommends tzdata && \
    apt-get install -y \
    python3 \
    python3-dev \
    python3-pip \
    locales \
    libtinfo5 \
    python3-pyqt5 \
    xterm \
    libnss3-dev \
    libasound2 \
    libreadline6-dev

RUN locale-gen en_US.UTF-8
RUN update-locale LANG=en_US.UTF-8

ARG uid
ARG gid
ARG user
RUN groupadd -g ${gid} -o ${user}
RUN useradd -m -N --gid ${gid} --shell /bin/bash --uid ${uid} ${user}

RUN mkdir /u1

USER ${user}
WORKDIR /home/${user}
