Xilinx docker repository

<!--- ######################################################## -->

### How to clone the Git repo

``` bash
git clone https://github.com/slaclab/tid-id-xilinx-dockers.git
```

<!--- ######################################################## -->

### Tested Xilinx/Matlab Environments

| Vivado Version | DSP SW Package   | Matlab Version |
|:--------------:|:----------------:|:--------------:|
| 2016.4         | sysgen           | R2016b         |
| 2018.3         | sysgen           | R2017b         |
| 2023.1         | model_composer   | R2021a         |

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

# Build the docker (Example: ./build_docker.sh model_composer-2023.1)
./build_docker.sh <platform>

# Run the docker (Example: ./run_docker.sh model_composer-2023.1)
./run_docker.sh <platform>
```

The docker starts in the local directory: /home/$USER/

<!--- ######################################################## -->

# How to Make a Dockerfile for Model Composer
1. Consult the [Vitis Model Composer User Guide (UG1483)](https://docs.amd.com/r/2023.1-English/ug1483-model-composer-sys-gen-user-guide/Supported-MATLAB-Versions-and-Operating-Systems) to see what versions of MATLAB and which operating systems are supported.

2. Pick a version of MATLAB and check which operating systems Mathworks has dependencies documented for in their github [link](https://github.com/mathworks-ref-arch/container-images/tree/main/matlab-deps). Ideally, there already exists a Dockerfile and dependencies for an OS that is compatible with Vitis Model Composer (see step 1) and that you are happy using. If you want to use a different OS, consult the [MATLAB/Simulink System Requirements](https://www.mathworks.com/support/requirements/previous-releases.html) and create your own Dockerfile with the correct OS and dependencies.

3. For example, we can create a Dockerfile for Vitis Model Composer 2023.1 and MATLAB/Simulink R2021a using the [Mathworks-maintained Ubuntu 20.04 container](https://github.com/mathworks-ref-arch/container-images/tree/main/matlab-deps/r2021a/ubuntu20.04) as a starting point.

4. Copy the Mathworks Dockerfile and the `base-dependencies.txt`. Uncomment lines in the Mathworks Dockerfile as needed for your application. Paste the following lines to the end of the Dockerfile to retain your user permissions in the docker container and mount `/u1` and `/afs` where the install files are located.
