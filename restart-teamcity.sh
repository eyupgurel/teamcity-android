#!/usr/bin/env bash

docker container restart tmca

docker container restart tmcs

docker container restart tmcdb

docker container restart android-emulator

docker container ls -a
docker network ls
docker image ls

