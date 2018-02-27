#!/usr/bin/env bash
# parameters:
# the first parameter is network which defaults to host
bash freeze-teamcity.sh

docker container rm -f tmca

docker container rm -f tmcs

docker container rm -f tmcdb

bash destroy-emulator.sh

#docker network rm sun

docker container ls -a
docker network ls
docker image ls


