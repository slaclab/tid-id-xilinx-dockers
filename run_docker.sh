#!/bin/bash

docker run -ti \
   --net=host \
   -e DISPLAY=${DISPLAY} \
   -v ${HOME}/.Xauthority:/home/${USER}/.Xauthority \
   -v /afs/:/afs \
   -v /etc/localtime:/etc/localtime:ro \
   -v /u1:/u1 \
   -v ${HOME}:/myhome \
   tid-xilinx-${USER}:latest /bin/bash

