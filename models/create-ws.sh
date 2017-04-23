#!/bin/bash

# Create a ROS workspace

# Usage:
# ./create-ws.sh <workspace-name>

# Backing up present working directory
hdir=$(pwd)

printf "Creating workspace at: \\n$HOME/ros-ws/$1/\\n"
mkdir -p ~/ros-ws/$1/src
cd ~/ros-ws/$1/src
catkin_init_workspace
cd ~/ros-ws/$1/
catkin_make
source ~/ros-ws/$1/devel/setup.bash
printf "\n# $1 ROS workspace:\nsource $HOME/ros-ws/$1/devel/setup.bash\n" >> ~/.bashrc

# Back to original working directory
cd $hdir
