# Use the official CentOS 7 image as the base
FROM centos:centos7

# Add base URL for the CentOS repository directly
RUN echo -e "[base]\nname=CentOS-7 - Base\nbaseurl=http://vault.centos.org/7.9.2009/os/x86_64/\ngpgcheck=1\ngpgkey=http://vault.centos.org/7.9.2009/os/x86_64/RPM-GPG-KEY-CentOS-7\nenabled=1\n\n[updates]\nname=CentOS-7 - Updates\nbaseurl=http://vault.centos.org/7.9.2009/updates/x86_64/\ngpgcheck=1\ngpgkey=http://vault.centos.org/7.9.2009/os/x86_64/RPM-GPG-KEY-CentOS-7\nenabled=1\n\n[extras]\nname=CentOS-7 - Extras\nbaseurl=http://vault.centos.org/7.9.2009/extras/x86_64/\ngpgcheck=1\ngpgkey=http://vault.centos.org/7.9.2009/os/x86_64/RPM-GPG-KEY-CentOS-7\nenabled=1" > /etc/yum.repos.d/CentOS-Base.repo

# Install EPEL repository for extra packages
RUN yum install -y epel-release

# Add the IUS repository for Git 2.x
RUN yum install -y https://repo.ius.io/ius-release-el7.rpm

# Update all packages
RUN yum update -y

# Install required packages for VCS and Verdi
RUN yum install -y \
    gcc \
    gcc-c++ \
    make \
    glibc-devel \
    libX11-devel \
    libXrender \
    libXrandr \
    libXtst \
    mesa-libGL \
    mesa-libGLU \
    ncurses-devel \
    motif \
    elfutils-libelf-devel \
    redhat-lsb \
    tcl \
    tk \
    compat-libstdc++-33 \
    libXp \
    libXext \
    libjpeg \
    libpng \
    libuuid \
    perl \
    perl-Data-Dumper \
    perl-File-Temp \
    perl-Getopt-Long \
    perl-Time-HiRes \
    perl-Env \
    wget

# Install packages for ruckus and (rogue+VCS co-simulation)
RUN yum install -y \
    git2u \
    git-lfs \
    zeromq \
    zeromq-devel

# Clean up
RUN yum clean all

# Generate the en_US.UTF-8 locale
RUN localedef -c -i en_US -f UTF-8 en_US.UTF-8

# Set the environment variables for locale
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# Define build arguments
ARG uid
ARG gid
ARG user

# Create user and group with specified uid and gid
RUN groupadd -g ${gid} -o ${user}
RUN useradd -m -N --gid ${gid} --shell /bin/bash --uid ${uid} ${user}

# Create required directories
RUN mkdir /u1
RUN mkdir /afs

# Set the SHELL environment variable
ENV SHELL /bin/bash

# Set the working directory and switch to the created user
USER ${user}
WORKDIR /home/${user}
