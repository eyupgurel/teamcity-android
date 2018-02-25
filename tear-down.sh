#!/usr/bin/env bash

docker container stop teamcity-agent
docker container rm -f teamcity-agent

docker container stop teamcity-server
docker container rm -f teamcity-server

docker container stop teamcity-db
docker container rm -f teamcity-db

docker container update --restart no android-emulator
docker container stop android-emulator
docker container rm -f  android-emulator

