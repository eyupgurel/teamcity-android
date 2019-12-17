#!/usr/bin/env bash
docker container update --restart no android-emulator
docker container stop android-emulator
docker container rm -f android-emulator
