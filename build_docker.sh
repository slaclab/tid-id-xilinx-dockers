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

# Check if $dockerConfig directory exists
if [ ! -d "$dockerConfig" ]; then
   echo "${PWD}/$dockerConfig directory does not exists"
   exit 1
fi

# Check if $dockerConfig directory exists
if [ ! -e "$dockerConfig/Dockerfile" ]; then
   echo "${PWD}/$dockerConfig/Dockerfile file does not exists"
   exit 1
fi

# Build the docker
docker image build $dockerConfig/. -t \
   $dockerName:latest \
   --build-arg user=${USER} \
   --build-arg uid="$(id -u)" \
   --build-arg gid="$(id -g)"
