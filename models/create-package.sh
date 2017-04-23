#!/bin/bash

# Create a ROS package

# Usage:
# ./create-package.sh <workspace-name> <package-name>

# Backing up present working directory
hdir=$(pwd)

printf "Creating package at: \\n$HOME/ros-ws/$1/src/\\n"
cd ~/ros-ws/$1/src/
catkin_create_pkg $2 rospy
source ~/ros-ws/$1/devel/setup.bash

# Back to original working directory
cd $hdir
