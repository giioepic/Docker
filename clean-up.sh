#!/bin/bash

# Stop all running containers
docker stop $(docker ps -q)

# Remove all containers
docker rm $(docker ps -a -q)

# Remove all images
docker rmi $(docker images -q)

# Remove all volumes
docker volume ls -q | xargs docker volume rm

echo "All running containers, containers, images, and volumes have been removed."

