#!/usr/bin/env bash

docker container start tmca1

docker container exec tmca1 /services/run-docker.sh

docker container start tmca2

docker container exec tmca2 /services/run-docker.sh

docker container start tmca3

docker container exec tmca3 /services/run-docker.sh

docker container start tmcs

docker container start tmcdb

docker container ls -a

docker network ls

docker image ls


