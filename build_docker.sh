#!/bin/bash

docker image build . -t tid-xilinx-${USER}:latest --build-arg user=${USER} --build-arg uid=$(id -u)
