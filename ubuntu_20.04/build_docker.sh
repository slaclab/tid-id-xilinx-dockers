#!/bin/bash

docker image build . -t tid-xilinx-u20-04-${USER}:latest --build-arg user=${USER} --build-arg uid=$(id -u)
