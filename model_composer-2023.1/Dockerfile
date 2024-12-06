FROM ubuntu:20.04

# Install Matlab packages
RUN export DEBIAN_FRONTEND=noninteractive \
    && apt-get update \
    && apt-get install --no-install-recommends -y `cat ${depDir}/matlab-deps.txt` \
    && apt-get clean && apt-get -y autoremove \
    && rm -rf /var/lib/apt/lists/*

RUN [ -d /usr/share/X11/xkb ] || mkdir -p /usr/share/X11/xkb
RUN export DEBIAN_FRONTEND=noninteractive && apt-get update -y && apt-get install -y gcc g++ gfortran && apt-get clean && apt-get -y autoremove && rm -rf /var/lib/apt/lists/*
RUN export DEBIAN_FRONTEND=noninteractive && apt-get update -y && apt-get install -y csh && apt-get clean && apt-get -y autoremove && rm -rf /var/lib/apt/lists/*

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
    nano \
    libnss3-dev \
    libasound2 \
    libreadline6-dev \
    && apt-get clean && apt-get -y autoremove \
    && rm -rf /var/lib/apt/lists/*

RUN locale-gen en_US.UTF-8
RUN update-locale LANG=en_US.UTF-8

ARG uid
ARG gid
ARG user
RUN groupadd -g ${gid} -o ${user}
RUN useradd -m -N --gid ${gid} --shell /bin/bash --uid ${uid} ${user}

RUN mkdir /u1
RUN mkdir /afs
RUN mkdir /sdf

USER ${user}
WORKDIR /home/${user}
