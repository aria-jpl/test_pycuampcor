# Test PyCuAmpcor module of ISCE2

## Running the test
1. Start up a GPU instance (e.g. p2.xlarge) and log into it.
1. Clone this repo and cd to it:
   ```
   git clone https://github.com/aria-jpl/test_pycuampcor
   cd test_pycuampcor
   ```
1. Download the SLCs:
   ```
   wget https://github.com/aria-jpl/test_pycuampcor/releases/download/v0.1/20110119.slc
   wget https://github.com/aria-jpl/test_pycuampcor/releases/download/v0.1/20110306.slc
   ```
1. Pull the hysds/isce2:latest-cuda docker image:
   ```
   docker pull hysds/isce2:latest-cuda
   ```
   *Note*: This docker image was built from a fork (https://github.com/pymonger/isce2/tree/develop)
   of the official isce2 repo (https://github.com/isce-framework/isce2). The fork was updated to 
   compile on centos 7 using CUDA version 9.2.
1. Start up docker container and mount in this directory:
   ```
   docker run --rm -ti -u $ID:$(id -g) --gpus=all \
     -v $(pwd):/tmp/test_pycuampcor \
     -w /tmp/test_pycuampcor hysds/isce2:latest-cuda
   ```
1. In a separate terminal on the same instance, run the following
   command to monitor the GPU usage on the instance:
   ```
   watch nvidia-smi
   ```
1. Run the test:
   ```
   ./run_test.sh
   ```
1. The output files will be generated in the `test` directory:
   ```
   ls -al test
   ```

## Example
- Screen output of `./run_test.sh`:
   ```
   This is the Open Source version of ISCE.
   Some of the workflows depend on a separate licensed package.
   To obtain the licensed package, please make a request for ISCE
   through the website: https://download.jpl.nasa.gov/ops/request/index.cfm.
   Alternatively, if you are a member, or can become a member of WinSAR
   you may be able to obtain access to a version of the licensed sofware at
   https://winsar.unavco.org/software/isce
   gpuDeviceInit() Using CUDA Device 0 ...
   Debug 40 40
   corrRawZoomInHeight: 17
   corrRawZoomInWidth: 17
   all objects in chunk are created ...
   corrRawZoomInHeight: 17
   corrRawZoomInWidth: 17
   all objects in chunk are created ...
   Total number of windows (azimuth x range):  40 x 100
   to be processed in the number of chunks: 40 x 10
   Processing chunk (0, x)
   Processing chunk (1, x)
   Processing chunk (2, x)
   Processing chunk (3, x)
   Processing chunk (4, x)
   Processing chunk (5, x)
   Processing chunk (6, x)
   Processing chunk (7, x)
   Processing chunk (8, x)
   Processing chunk (9, x)
   Processing chunk (10, x)
   Processing chunk (11, x)
   Processing chunk (12, x)
   Processing chunk (13, x)
   Processing chunk (14, x)
   Processing chunk (15, x)
   Processing chunk (16, x)
   Processing chunk (17, x)
   Processing chunk (18, x)
   Processing chunk (19, x)
   Processing chunk (20, x)
   Processing chunk (21, x)
   Processing chunk (22, x)
   Processing chunk (23, x)
   Processing chunk (24, x)
   Processing chunk (25, x)
   Processing chunk (26, x)
   Processing chunk (27, x)
   Processing chunk (28, x)
   Processing chunk (29, x)
   Processing chunk (30, x)
   Processing chunk (31, x)
   Processing chunk (32, x)
   Processing chunk (33, x)
   Processing chunk (34, x)
   Processing chunk (35, x)
   Processing chunk (36, x)
   Processing chunk (37, x)
   Processing chunk (38, x)
   Processing chunk (39, x)
   ```
- Screen output of `watch nvidia-smi`:
   ```
   Every 2.0s: nvidia-smi                                 Fri Dec  6 03:14:29 2019
   
   Fri Dec  6 03:14:29 2019
   +-----------------------------------------------------------------------------+
   | NVIDIA-SMI 418.87.01    Driver Version: 418.87.01    CUDA Version: 10.1     |
   |-------------------------------+----------------------+----------------------+
   | GPU  Name        Persistence-M| Bus-Id        Disp.A | Volatile Uncorr. ECC |
   | Fan  Temp  Perf  Pwr:Usage/Cap|         Memory-Usage | GPU-Util  Compute M. |
   |===============================+======================+======================|
   |   0  Tesla K80           On   | 00000000:00:1E.0 Off |                    0 |
   | N/A   53C    P0    61W / 149W |    137MiB / 11441MiB |      2%      Default |
   +-------------------------------+----------------------+----------------------+
   
   +-----------------------------------------------------------------------------+
   | Processes:                                                       GPU Memory |
   |  GPU       PID   Type   Process name                             Usage      |
   |=============================================================================|
   |    0     18776      C   python                                       126MiB |
   +-----------------------------------------------------------------------------+
   ```
- Output files:
   ```
   ls -al test
   total 268
   drwxr-xr-x 2 ops ops  6144 Dec  6 03:18 .
   drwxr-xr-x 4 ops ops  6144 Dec  6 03:17 ..
   -rw-r--r-- 1 ops ops 48000 Dec  6 03:18 cov.cov
   -rw-r--r-- 1 ops ops 32000 Dec  6 03:18 DenseOffset.off
   -rw-r--r-- 1 ops ops 16000 Dec  6 03:18 floatImage1
   -rw-r--r-- 1 ops ops 32000 Dec  6 03:18 GrossOffset.off
   -rw-r--r-- 1 ops ops 11560 Dec  6 03:18 i_corrBatchZoomInValid
   -rw-r--r-- 1 ops ops 16000 Dec  6 03:18 intImage1
   -rw-r--r-- 1 ops ops    80 Dec  6 03:18 offsetInit1
   -rw-r--r-- 1 ops ops 67240 Dec  6 03:18 r_corrBatchRaw
   -rw-r--r-- 1 ops ops 11560 Dec  6 03:18 r_corrBatchRawZoomIn
   -rw-r--r-- 1 ops ops    40 Dec  6 03:18 r_maxval
   -rw-r--r-- 1 ops ops 16000 Dec  6 03:18 snr.snr
   ```
