#!/usr/bin/env bash
# parameters:
# the first parameter is network which defaults to host
echo "freezing containers..."
docker container stop tmca1
docker container stop tmca2
docker container stop tmca3
docker container stop tmcs
docker container stop tmcdb
echo "freezing complete!"
docker container ls -a
docker network ls
docker image ls


