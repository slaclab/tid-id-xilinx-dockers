Xilinx docker repository

<!--- ######################################################## -->

### How to clone the Git repo

``` bash
git clone https://github.com/slaclab/tid-id-xilinx-dockers.git
```

<!--- ######################################################## -->

### Tested Xilinx/Matlab Environments

| Vivado Version | DSP SW Package   | Matlab Version | Tested Docker |
|:--------------:|:----------------:|:--------------:|:-------------:|
| 2016.4         | sysgen           | R2016b         | centos7       |
| 2018.3         | sysgen           | R2017b         | centos7       |
| 2023.1         | model_composer   | R2021a         | ubuntu_20.04  |

<!--- ######################################################## -->

### Setting up docker

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

`Log out` and `log in` again into the server

<!--- ######################################################## -->

### Building and running the docker

```bash
# Go to Git clone
cd tid-id-xilinx-dockers

# Build the docker (Example: ./build_docker.sh model_composer 2023.1)
./build_docker.sh <platform> <version>

# Run the docker (Example: ./run_docker.sh model_composer 2023.1)
./run_docker.sh <platform> <version>
```

The docker starts in the local directory: /u1/$USER/

You have access to your afs home directory in /myhome but it is currently readonly because of the way docker runs.

<!--- ######################################################## -->
