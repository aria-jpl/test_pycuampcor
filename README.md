# Test PyCuAmpcor module of ISCE2
1. Start up an instance with GPU (e.g. p2.xlarge).
1. Pull the isce/isce2:cuda-9.2 (or hysds/isce2:2.3-cuda-9.2) docker image:
   ```
   docker pull isce/isce2:cuda-9.2
   ```
1. Start up docker container and mount in this directory:
   ```
   docker run --rm -ti --gpus=all -v $(pwd):/tmp/test_pycuampcor \
     -w /tmp/test_pycuampcor isce/isce2:cuda-9.2
   ```
1. In a separate terminal on the same instance, run `watch nvidia-smi` to 
   monitor the GPU usage:
   ```
   watch nvidia-smi
   ```
1. In the docker container, clone this repo and enter it:
   ```
   git clone https://github.com/aria-jpl/test_pycuampcor
   cd test_pycuampcor
   ```
1. Download the SLCs:
   ```
   wget 
   wget
   ```
1. Run the test:
   ```
   ./run_test.sh
   ```
