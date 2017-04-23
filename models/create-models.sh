#!/bin/bash

num_boxes=5

# Boxes
./cleanup.sh
for i in $(seq 0 $num_boxes)
do
	./gen-alvar.sh $i
	./purge-model.sh box_$i
	./create-model-box.sh box_$i MarkerData_$i.png 0.2 0.2 0.2 0 1 1
done

# Low Walls
./purge-model.sh low_wall
./create-model-box.sh low_wall wall.jpg 4 0.1 0.5 1 0.125 0.5

# Low pillars
./purge-model.sh low_pillar
./create-model-box.sh low_pillar wall.jpg 0.1 0.1 0.5 1 5 0.5

# Floor
./purge-model.sh floor
./create-model-flat.sh floor floor.jpg 4 4 0.25 0.25