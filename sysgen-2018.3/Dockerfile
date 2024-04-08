FROM centos:centos7

RUN yum -y install \
   xterm \
   java-1.8.0-openjdk-devel \
   libXrandr \
   libnss3 \
   libasound2 \
   libreadline6 \
   python3 \
   python3-dev \
   python3-pip \
   libtinfo5 \
   python3-pyqt5 \
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
