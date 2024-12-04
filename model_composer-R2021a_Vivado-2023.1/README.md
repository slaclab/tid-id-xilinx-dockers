# Notes
This Dockerfile has been tested with MATLAB 9.10.0.2198249 (R2021a) Update 8 and Vitis Model Composer 2023.1. It was validated using the 2023.1 Vitis Model Composer Example Design (SSR Digital Downconversion)[https://github.com/Xilinx/Vitis_Model_Composer/tree/2023.1/Examples/HDL/RFSoC/SSR_Digital_Down_Conversion]. In order for the environment to work properly, the following variables must be specified.

First, source the Vivado `settings64.sh` and set up the MATLAB license:
```
source /path/to/Vivado/2023.1/settings64.sh
export MATLAB_VERSION=R2021a
export MATLAB_TOP=/path/to/MATLAB/
export MLM_LICENSE_FILE=port@license_server_host
export XILINX_MATLAB_ROOT_PATH=$MATLAB_TOP/$MATLAB_VERSION
```
Put the correct MATLAB version first on the path:
```
export PATH=$XILINX_MATLAB_ROOT_PATH/bin:$PATH
```
Manually add the MATLAB Runtime Path (see (here)[https://www.mathworks.com/help/compiler/mcr-path-settings-for-run-time-deployment.html#mw_8b4e2361-7e0d-4eb9-b3d3-55762966f1b0])
```
export LD_LIBRARY_PATH="${LD_LIBRARY_PATH:+${LD_LIBRARY_PATH}:}\
$XILINX_MATLAB_ROOT_PATH/runtime/glnxa64:\
$XILINX_MATLAB_ROOT_PATH/bin/glnxa64:\
$XILINX_MATLAB_ROOT_PATH/sys/os/glnxa64:\
$XILINX_MATLAB_ROOT_PATH/extern/bin/glnxa64"
```
Lauch the tools by running
```
model_composer
```
