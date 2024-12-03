FROM ubuntu:20.04

# Install MathWorks Dependencies
COPY base-dependencies.txt /tmp/base-dependencies.txt
COPY add-on-dependencies.txt /tmp/add-on-dependencies.txt

RUN export DEBIAN_FRONTEND=noninteractive \
    && apt-get update \
    && apt-get install --no-install-recommends -y `cat /tmp/base-dependencies.txt` \
    && apt-get install --no-install-recommends -y `cat /tmp/add-on-dependencies.txt` \
    && apt-get clean && apt-get -y autoremove \
    && rm -rf /var/lib/apt/lists/*

RUN [ -d /usr/share/X11/xkb ] || mkdir -p /usr/share/X11/xkb

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
    libreadline6-dev

RUN locale-gen en_US.UTF-8
RUN update-locale LANG=en_US.UTF-8

ARG uid
ARG gid
ARG user
RUN groupadd -g ${gid} -o ${user}
RUN useradd -m -N --gid ${gid} --shell /bin/bash --uid ${uid} ${user}

RUN mkdir /u1
RUN mkdir /afs

USER ${user}
WORKDIR /home/${user}
