#!/bin/bash

# Configure the testbed package

# Usage:
# ./cfg.sh

# Backing up present working directory
hdir=$(pwd)

cd models
./create-ws.sh mobile
./create-package.sh mobile testbed
cd ../..
source ~/.bashrc
cp -Rf testbed $(rospack find testbed)/
cd $(rospack find testbed)/models/
./create-models.sh

# Back to original working directory
cd $hdir
