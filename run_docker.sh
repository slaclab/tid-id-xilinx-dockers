#!/bin/bash

# Check if both arguments are provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <platform> <version>"
    echo "Example: ./build_docker.sh model_composer 2023.1"
    exit 1
fi

# Assign arguments to variables
platform=$1
version=$2
dockerConfig=$platform-$version
dockerName=tid-$dockerConfig-${USER}

# Check if /u1 exists
if [ -d "/u1" ]; then
   mkdir -p /u1/$USER
else
   echo "/u1 does not exists"
   exit 1
fi

# Run the docker
docker run -ti \
   --net=host \
   -e DISPLAY=${DISPLAY} \
   -v ${HOME}/.Xauthority:/home/${USER}/.Xauthority \
   -v /afs/:/afs \
   -v /etc/localtime:/etc/localtime:ro \
   -v /u1:/u1 \
   -v ${HOME}:/myhome \
   $dockerName:latest /bin/bash
