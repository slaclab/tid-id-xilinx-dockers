#!/bin/bash

# Check if both arguments are provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <Dockerfile_directory_name>"
    echo "Example: ./build_docker.sh sysgen-2016.4"
    exit 1
fi

# Generate docker name (must be all lowercase)
dockerName=tid-$1-${USER}
dockerName=$(echo "$dockerName" | tr '[:upper:]' '[:lower:]')

# Check if Dockerfile directory exists
if [ ! -d "$1" ]; then
   echo "${PWD}/$dockerConfig directory does not exists"
   exit 1
fi

# Check if Dockerfile file exists
if [ ! -e "$1/Dockerfile" ]; then
   echo "${PWD}/$1/Dockerfile file does not exists"
   exit 1
fi

# Build the docker
docker image build --no-cache $1/. -t \
   $dockerName:latest \
   --build-arg user=${USER} \
   --build-arg uid="$(id -u)" \
   --build-arg gid="$(id -g)" \
   --build-arg depDir="${PWD}/$1"
