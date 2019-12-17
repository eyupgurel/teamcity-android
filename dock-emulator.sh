#!/usr/bin/env bash
# parameters:
xhost +
docker container run -d --name android-emulator --restart on-failure --privileged \
-e DISPLAY=$DISPLAY \
-v /tmp/.X11-unix:/tmp/.X11-unix -v /usr/lib:/usr/lib \
--network host -p 5554:5554 \
pinfake/android-emulator-x11