#!/usr/bin/env bash

CONTAINER=$1

shift
shift

#sudo cp cuda-devel.csv /etc/nvidia-container-runtime/host-files-for-container.d/

echo "Generating tar artifact for $CONTAINER container..."

sudo docker save -o $CONTAINER.tar $CONTAINER
