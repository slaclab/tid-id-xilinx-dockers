FROM registry.access.redhat.com/ubi8/ubi:latest

# Update the system and install the necessary development tools
RUN dnf -y update && \
    dnf -y install \
        gcc \
        gcc-c++ \
        make \
        automake \
        autoconf \
        libtool \
        nano \
        git \
        git-lfs \
        python3-devel \
        glibc-locale-source \
        glibc-langpack-en \
        ncurses-compat-libs \
        pkg-config \
        libX11 \
        wget \
        bc \
        mpfr \
        gawk \
        time \
    && dnf clean all

# Install ZeroMQ from source because not included with dnf 
RUN cd /tmp && \
    wget https://github.com/zeromq/libzmq/releases/download/v4.3.4/zeromq-4.3.4.tar.gz && \
    tar -xzf zeromq-4.3.4.tar.gz && \
    cd zeromq-4.3.4 && \
    ./configure && \
    make -j 8 && \
    make install && \
    ldconfig && \
    cd / && \
    rm -rf /tmp/zeromq-4.3.4.tar.gz /tmp/zeromq-4.3.4

# Ensure that ZeroMQ libraries are found
ENV PKG_CONFIG_PATH="/usr/local/lib/pkgconfig:$PKG_CONFIG_PATH"

# Generate the en_US.UTF-8 locale
RUN localedef -i en_US -f UTF-8 en_US.UTF-8

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
