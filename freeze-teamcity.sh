#!/usr/bin/env bash
# parameters:
# the first parameter is network which defaults to host

docker container stop tmca

docker container stop tmcs

docker container stop tmcdb

bash freeze-emulator.sh

docker container ls -a
docker network ls
docker image ls

