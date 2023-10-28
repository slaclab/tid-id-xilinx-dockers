FROM centos:centos7

RUN yum -y install xterm java-1.8.0-openjdk-devel libXrandr

ARG uid
ARG user
RUN useradd -m -N --gid 0 --shell /bin/bash --uid ${uid} ${user}

RUN mkdir /u1
RUN mkdir /afs
RUN mkdir /myhome

USER ${user}
WORKDIR /u1/${user}

