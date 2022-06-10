#!/bin/bash

MOD=$1
DOCKER_REPOS=192.168.1.11:8082
echo "Re-deploy service module ${MOD}"
docker rm -f $MOD
docker rmi -f $DOCKER_REPOS/nav-isl-$MOD
docker run -d --network host --name $MOD  $DOCKER_REPOS/nav-isl-$MOD
echo "Done"
