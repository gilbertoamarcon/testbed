#!/bin/bash

# Create ALVAR marker

# Usage:
# ./gen-alvar.sh <code-number>

hunit=25

rosrun ar_track_alvar createMarker -u $(($hunit*2)) $1
convert MarkerData_$1.png -bordercolor white -border $(($hunit*9))x$(($hunit*9)) MarkerData_$1.png

