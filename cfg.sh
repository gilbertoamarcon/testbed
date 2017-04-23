#!/bin/bash

# Configure the testbed package

# Usage:
# ./cfg.sh

# Backing up present working directory
hdir=$(pwd)

cd models
create-ws.sh mobile
create-package.sh mobile testbed
cd ../..
cp -Rf testbed $(ropack find testbed)/
cd $(ropack find testbed)/models/
./create-models.sh

# Back to original working directory
cd $hdir
