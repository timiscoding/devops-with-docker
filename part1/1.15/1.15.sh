#!/bin/bash

echo
echo 'CLONE REPO'
git clone git@github.com:timiscoding/blog-list.git

echo
echo 'BUILD DOCKER BACKEND IMAGE'
docker build -t blog-list-server -f backend.Dockerfile blog-list/server

# Containers can talk to each other by their container names only if:
#   * they are connected to a user created network. ie. not the default
#   * each container has a user created name. ie. docker run --name <name>
# See https://maximorlov.com/4-reasons-why-your-docker-containers-cant-talk-to-each-other/
# https://github.com/docker/for-win/issues/1009

# create a new network
# docker network create isolated

# create a new mongo container
echo
echo 'RUN MONGO CONTAINER'
docker run --rm -d --network isolated --name blog-list-mongo mongo:3.4

# https://hub.docker.com/repository/docker/timiscoding/blog-list-server
echo
echo 'RUN BACKEND CONTAINER'
docker run --rm --network isolated --name blog-list-server -p 3003:3003 blog-list-server

# You can confirm both containers are connected to the same network by doing
# docker network inspect isolated

echo
echo 'BUILD FRONTEND CONTAINER'
docker build -t blog-list-client -f frontend.Dockerfile blog-list/client

echo
echo 'RUN FRONTEND CONTAINER'
# https://hub.docker.com/repository/docker/timiscoding/blog-list-server
# -it is needed because otherwise server shutsdown prematurely
# this is a known issue with react-scripts 3.4.1
# https://github.com/facebook/create-react-app/issues/8688
docker run --rm -it -p 80:3000 --network isolated --name blog-list-client blog-list-client
