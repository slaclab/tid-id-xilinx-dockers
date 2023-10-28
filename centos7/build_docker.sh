#!/bin/bash

docker image build . -t tid-xilinx-centos7-${USER}:latest --build-arg user=${USER} --build-arg uid=$(id -u)
