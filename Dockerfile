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
ARG user
RUN useradd -m -N --gid 0 --shell /bin/bash --uid ${uid} ${user}

COPY setup_env.sh /
RUN mkdir /runtime
RUN mkdir /afs
RUN mkdir /local

USER ${user}
WORKDIR /runtime

#FROM rockylinux/rockylinux:8.4
#ENV container docker
#RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == \
#systemd-tmpfiles-setup.service ] || rm -f $i; done); \
#rm -f /lib/systemd/system/multi-user.target.wants/*;\
#rm -f /etc/systemd/system/*.wants/*;\
#rm -f /lib/systemd/system/local-fs.target.wants/*; \
#rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
#rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
#rm -f /lib/systemd/system/basic.target.wants/*;\
#rm -f /lib/systemd/system/anaconda.target.wants/*;
#VOLUME [ "/sys/fs/cgroup" ]
#CMD ["/usr/sbin/init"]

#localectl set-locale LANG=en_US.UTF-8

# Install Rogue
#ARG branch
#WORKDIR /usr/local/src
#RUN git clone https://github.com/slaclab/rogue.git -b $branch
#WORKDIR rogue
#RUN mkdir build
#WORKDIR build
#RUN cmake .. -DROGUE_INSTALL=system -DDO_EPICS=1
#RUN make -j4 install
#RUN ldconfig
#ENV PYQTDESIGNERPATH /usr/local/lib/python3.10/dist-packages/pyrogue/pydm
#ENV PYDM_DATA_PLUGINS_PATH /usr/local/lib/python3.10/dist-packages/pyrogue/pydm/data_plugins
#ENV PYDM_TOOLS_PATH /usr/local/lib/python3.10/dist-packages/pyrogue/pydm/tools
#WORKDIR /root
