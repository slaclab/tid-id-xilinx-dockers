FROM centos:centos7

RUN yum -y install \
   xterm \
   java-1.8.0-openjdk-devel \
   python3 \
   python3-dev \
   python3-pip \
   python3-pyqt5 \
   libXrandr \
   libnss3 \
   libasound2 \
   libreadline6 \
   libtinfo5 \
   libXScrnSaver \
   libxkbcommon \
   xkeyboard-config \
   xorg-x11-xkb-utils \
   gcc \
   g++

ARG uid
ARG gid
ARG user
RUN groupadd -g ${gid} -o ${user}
RUN useradd -m -N --gid ${gid} --shell /bin/bash --uid ${uid} ${user}

RUN mkdir /u1
RUN mkdir /afs
RUN mkdir /myhome

USER ${user}
WORKDIR /u1/${user}
