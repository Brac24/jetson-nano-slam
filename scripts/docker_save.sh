#!/usr/bin/env bash

DOCKER_IMAGE=$1

shift
shift
echo "Generating tar artifact for $DOCKER_IMAGE Docker image..."

# creates a tar of a Docker image which we can then load onto any machine
sudo docker save -o $DOCKER_IMAGE.tar $DOCKER_IMAGE
