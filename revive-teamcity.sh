#!/usr/bin/env bash

docker container start tmca

docker container start tmcs

docker container start tmcdb

docker container start android-emulator

docker container ls -a
docker network ls
docker image ls


