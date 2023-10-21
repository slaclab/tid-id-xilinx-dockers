Xilinx docker repository.

To run this on a build server you need to first install docker:

```

   > sudo apt-get install docker

```

You must then add your user id to the docker group in /etc/groups


```

   > sudo usermod -a -G docker userName

```

You can then enable and start the docker service on the machine:

```

   > systemctrl enable docker
   > systemctrl start docker

```

You can then build and run the docker image with the commands:

```
   > git clone https://github.com/slaclab/tid-id-xilinx-dockers
   > cd tid-id-xilinx-dockers
   > ./build_docker.sh
   > ./run_docker.sh

```

Inside the docker you can then source the environment and run model composer


```

   > soruce /setup_env.sh
   > model_composer

```

The docker starts in the local directory: /u1/$USER/docker-runtime.

You have access to your afs home directory in /myhome but it is currently readonly because of the way docker runs.
