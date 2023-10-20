#!/bin/bash

mkdir -p /u1/${USER}/docker-runtime

docker run -ti \
   --net=host \
   -e DISPLAY=${DISPLAY} \
   -v ${HOME}/.Xauthority:/home/${USER}/.Xauthority \
   -v /afs/:/afs:ro \
   -v /etc/localtime:/etc/localtime:ro \
   -v /u1/${USER}/docker-runtime:/runtime \
   -v ${HOME}:/myhome \
   tid-xilinx-${USER}:latest /bin/bash

