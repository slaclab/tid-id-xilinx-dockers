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

# Run the docker
docker run -ti \
   --net=host \
   -e DISPLAY=${DISPLAY} \
   -v ${HOME}/.Xauthority:/home/${USER}/.Xauthority \
   -v /etc/localtime:/etc/localtime:ro \
   -v /afs/:/afs \
   -v /u1:/u1 \
   -v /home:/home \
   $dockerName:latest /bin/bash
