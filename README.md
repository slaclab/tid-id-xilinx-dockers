Xilinx docker repository.

To run this on a build server you need to first install docker:

''''
   apt-get install docker

You must then add your user id to the docker group in /etc/groups

You can then enable and start the docker service on the machine:

''''
   systemctrl enable docker
   systemctrl start docker

