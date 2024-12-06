FROM ubuntu:20.04

## Install system tools
COPY user-dependencies.txt /tmp/user-dependencies.txt
COPY matlab-dependencies.txt /tmp/matlab-dependencies.txt
COPY vivado-dependencies.txt /tmp/vivado-dependencies.txt

RUN apt-get update -y
RUN export DEBIAN_FRONTEND=noninteractive \
    && apt-get install --no-install-recommends -y `cat /tmp/matlab-dependencies.txt` \
    && apt-get install --no-install-recommends -y `cat /tmp/vivado-dependencies.txt` \
    && apt-get install --no-install-recommends -y `cat /tmp/user-dependencies.txt` \
    && apt-get clean && apt-get -y autoremove \
    && rm -rf /var/lib/apt/lists/*

## Install qt4 from a weird place because some docs say Vitis Model Composer on Ubuntu 20 requires it
## https://adaptivesupport.amd.com/s/question/0D52E00006vF6FOSA0/model-composer-v20212-matlab-r2021a-gets-stuck-at-initialization-stage-on-ubuntu-20041?language=en_US
RUN export DEBIAN_FRONTEND=noninteractive \
    && add-apt-repository ppa:rock-core/qt4 \
    && apt-get update -y \
    && apt-get install -y \
       libqtcore4 \
       libqtgui4 \
       libtinfo-dev

RUN [ -d /usr/share/X11/xkb ] || mkdir -p /usr/share/X11/xkb

ARG uid
ARG gid
ARG user
RUN groupadd -g ${gid} -o ${user}
## Uncomment the line below to make your user name have sudo access with password 'password'. This is useful for debugging inside the docker container but use caution.
#RUN useradd -m -N --gid ${gid} --shell /bin/bash --uid ${uid} ${user} && echo ${user}:password | chpasswd && adduser ${user} sudo
RUN useradd -m -N --gid ${gid} --shell /bin/bash --uid ${uid} ${user}

RUN mkdir /u1
RUN mkdir /afs

USER ${user}
WORKDIR /home/${user}
