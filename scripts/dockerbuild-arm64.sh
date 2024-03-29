#!/bin/bash

CONTAINER_NAME=$1
DOCKERFILE=$2

echo $CONTAINER_NAME
echo $DOCKERFILE

# You need docker buildx to use this
# https://docs.docker.com/build/install-buildx/
# add this to log the output of the docker build to a file: &> docker-build.log
docker build --platform linux/arm64 --network=host --progress=plain -t $CONTAINER_NAME -f $DOCKERFILE .