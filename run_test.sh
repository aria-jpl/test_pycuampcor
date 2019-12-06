#!/bin/bash
BASE_PATH=$(dirname "${BASH_SOURCE}")
BASE_PATH=$(cd "${BASE_PATH}"; pwd)

# source ISCE2 environment
source /opt/isce2/isce_env.sh

# clean out test dir
rm -rf $BASE_PATH/test
mkdir $BASE_PATH/test

# run test
cd $BASE_PATH/test
python $BASE_PATH/pycuampcor_test.py
