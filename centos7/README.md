Xilinx docker repository.

To run this on a build server you need to first install docker:
```bash
sudo apt-get install docker docker.io
```

You must then add your user id to the docker group in /etc/groups
```bash
sudo usermod -a -G docker $USER
```

You can then enable and start the docker service on the machine:
```bash
sudo systemctl enable docker
sudo systemctl start docker
```

`Log out` and `log in` again into the servr

You can then build and run the docker image with the commands:

```bash
git clone https://github.com/slaclab/tid-id-xilinx-dockers
cd tid-id-xilinx-dockers/centos7
./build_docker.sh
./run_docker.sh
```

The docker starts in the local directory: /u1/$USER/

You have access to your afs home directory in /myhome but it is currently readonly because of the way docker runs.


