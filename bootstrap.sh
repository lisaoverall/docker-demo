#!/bin/bash

# create Docker network
docker network create foo

# build Docker webserver image
docker build . -f Dockerfile.webserver --tag=ws

# run Docker webserver container
docker run --name server --network foo -d ws 

# build Docker host image
docker build . -f Dockerfile.host --tag=h

# run Docker host with curl command
docker run --name host --network foo -it h server:8080