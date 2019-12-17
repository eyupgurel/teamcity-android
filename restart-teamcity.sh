#!/usr/bin/env bash

docker container restart tmca1

docker container exec tmca1 /services/run-docker.sh

docker container restart tmca2

docker container exec tmca2 /services/run-docker.sh

docker container restart tmcs

docker container restart tmcdb

docker container restart android-emulator

docker container ls -a
docker network ls
docker image ls

