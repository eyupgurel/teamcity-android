#!/usr/bin/env bash
# parameters:
# the first parameter is network which defaults to host
bash freeze-teamcity.sh

docker container rm -f tmca1

docker container rm -f tmca2

docker container rm -f tmca3

docker container rm -f tmcs

docker container rm -f tmcdb

#docker network rm sun
echo "__________________________containers__________________________________"
docker container ls -a
echo "__________________________containers__________________________________"
echo "__________________________networks__________________________________"
docker network ls
echo "__________________________networks__________________________________"
echo "__________________________images__________________________________"
docker image ls
echo "__________________________images__________________________________"


