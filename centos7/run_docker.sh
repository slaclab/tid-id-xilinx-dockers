#!/bin/bash

docker run -ti \
   --net=host \
   -e DISPLAY=${DISPLAY} \
   -v ${HOME}/.Xauthority:/home/${USER}/.Xauthority \
   -v /afs/:/afs \
   -v /etc/localtime:/etc/localtime:ro \
   -v /u1:/u1 \
   -v ${HOME}:/myhome \
   tid-xilinx-centos7-${USER}:latest /bin/bash

