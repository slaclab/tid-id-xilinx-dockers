# Notes
This Dockerfile has been tested with MATLAB 9.10.0.2198249 (R2021a) Update 8 and Vitis Model Composer 2023.1. It was validated using the 2023.1 Vitis Model Composer Example Design [SSR Digital Downconversion](https://github.com/Xilinx/Vitis_Model_Composer/tree/2023.1/Examples/HDL/RFSoC/SSR_Digital_Down_Conversion). In order for the environment to work properly, the following variables must be specified.

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
Manually add the MATLAB Runtime Path (see [here](https://www.mathworks.com/help/compiler/mcr-path-settings-for-run-time-deployment.html#mw_8b4e2361-7e0d-4eb9-b3d3-55762966f1b0)):
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

Please note the `matlab-dependencies.txt` file in this directory is copied from the Mathworks-maintained R2021a Ubuntu image available [here](https://github.com/mathworks-ref-arch/container-images/blob/6133a1472cc927e81607e38277d4cf9a69f60c05/matlab-deps/r2021a/ubuntu20.04/base-dependencies.txt) because Docker does not support access the submodle file directly as it is outside the build directory.
