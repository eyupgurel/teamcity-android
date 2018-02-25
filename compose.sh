#!/usr/bin/env bash
# parameters:
#   first parameter dictates emulator restart mod

TEAMCITY_SRV_DATADIR=~/Workspace/TeamCity/data/
TEAMCITY_SRV_LOGDIR=~/Workspace/TeamCity/logs/
TEAMCITY_AGENT_CONFDIR=~/Workspace/TeamCity/agent/
TEAM_CITY_DB_DATADIR=~/mount/postgres/teamcity/

#if absent make volumes directories
mkdir ${TEAMCITY_SRV_DATADIR} --parents
mkdir ${TEAMCITY_SRV_LOGDIR} --parents
mkdir ${TEAMCITY_AGENT_CONFDIR} --parents
mkdir ${TEAM_CITY_DB_DATADIR} --parents

docker container run -d --name teamcity-server -v ${TEAMCITY_SRV_DATADIR}:/data/teamcity_server/datadir -v ${TEAMCITY_SRV_LOGDIR}:/opt/teamcity/logs -p 8111:8111 \
--network host eyupgurel/teamcity-android-server:2017.2.2


xhost +
docker container run -d --name android-emulator --restart ${1:-always} --privileged --network=host \
-e DISPLAY=$DISPLAY \
-v /tmp/.X11-unix:/tmp/.X11-unix -v /usr/lib:/usr/lib \
pinfake/android-emulator-x11

docker container run -d --name teamcity-agent -v ${TEAMCITY_AGENT_CONFDIR}:/data/teamcity_agent/conf \
--device /dev/bus/usb:/dev/bus/usb --network host \
-e SERVER_URL=http://localhost:8111 eyupgurel/teamcity-android-agent:2017.2.2

docker container run -d --name teamcity-db -v ${TEAM_CITY_DB_DATADIR}:/var/lib/postgresql/data \
--network host -p 5432:5432 \
-e POSTGRES_PASSWORD=eX933dISQSLT \
-e shared_buffers=512MB \
-e max_wal_size=1500MB \
-e checkpoint_completion_target=0.9 \
-e synchronous_commit=off \
postgres:10.2




