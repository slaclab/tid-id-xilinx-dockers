FROM centos:centos7

# Add base URL for the CentOS repository directly
RUN echo -e "[base]\nname=CentOS-7 - Base\nbaseurl=http://vault.centos.org/7.9.2009/os/x86_64/\ngpgcheck=1\ngpgkey=http://vault.centos.org/7.9.2009/os/x86_64/RPM-GPG-KEY-CentOS-7\nenabled=1\n\n[updates]\nname=CentOS-7 - Updates\nbaseurl=http://vault.centos.org/7.9.2009/updates/x86_64/\ngpgcheck=1\ngpgkey=http://vault.centos.org/7.9.2009/os/x86_64/RPM-GPG-KEY-CentOS-7\nenabled=1\n\n[extras]\nname=CentOS-7 - Extras\nbaseurl=http://vault.centos.org/7.9.2009/extras/x86_64/\ngpgcheck=1\ngpgkey=http://vault.centos.org/7.9.2009/os/x86_64/RPM-GPG-KEY-CentOS-7\nenabled=1" > /etc/yum.repos.d/CentOS-Base.repo

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
   perl \
   perl-Data-Dumper \
   which \
   nano \
   gcc \
   g++

RUN localedef -c -i en_US -f UTF-8 en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

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
