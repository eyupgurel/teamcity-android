#!/usr/bin/env bash
#!/usr/bin/env bash
# parameters:

#if absent make volumes directories
mkdir ~/Workspace/TeamCity/data/ --parents
mkdir ~/Workspace/TeamCity/logs/ --parents
mkdir ~/Workspace/TeamCity/agent/ --parents
mkdir ~/mount/postgres/teamcity/ --parents

#docker network create sun

xhost +
docker container run -d --name android-emulator --restart always --privileged \
-e DISPLAY=$DISPLAY \
-v /tmp/.X11-unix:/tmp/.X11-unix -v /usr/lib:/usr/lib \
--network bridge -p 5554:5554 \
pinfake/android-emulator-x11


docker container run -d --name tmcs -v ~/Workspace/TeamCity/data/:/data/teamcity_server/datadir -v ~/Workspace/TeamCity/logs/:/opt/teamcity/logs \
--network bridge -p 8111:8111 \
eyupgurel/teamcity-android-server:2017.2.2

#privileged is required to run docker in docker (i.e. if you want to build a container by docker build)
docker container run -d --name tmca --privileged -v ~/Workspace/TeamCity/agent/:/data/teamcity_agent/conf \
--device /dev/bus/usb:/dev/bus/usb \
--network bridge -p 9090:9090 \
-e SERVER_URL=http://tmcs:8111 \
-e DOCKER_IN_DOCKER=start \
-e DOCKER_IN_DOCKER=start \
eyupgurel/teamcity-android-agent:2017.2.2 bash /run-services.sh


docker container run -d --name tmcdb -v ~/mount/postgres/teamcity/:/var/lib/postgresql/data \
--network bridge -p 5432:5432 \
-e POSTGRES_PASSWORD=eX933dISQSLT \
-e shared_buffers=512MB \
-e max_wal_size=1500MB \
-e checkpoint_completion_target=0.9 \
-e synchronous_commit=off \
postgres:10.2

