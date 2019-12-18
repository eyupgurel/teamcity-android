#!/usr/bin/env bash
sh destroy-teamcity.sh

# parameters:
#if absent make volumes directories
mkdir ~/Workspace/TeamCity/data/ --parents
mkdir ~/Workspace/TeamCity/logs/ --parents
mkdir ~/Workspace/TeamCity/agent/heavypack/ --parents
mkdir ~/Workspace/TeamCity/agent/booster/ --parents
mkdir ~/Workspace/TeamCity/agent/connoisseur/ --parents
mkdir ~/mount/postgres/teamcity/ --parents

#docker network create sun

docker container run -d --name tmcdb -v ~/mount/postgres/teamcity/:/var/lib/postgresql/data \
--network host -p 5432:5432 \
-e POSTGRES_PASSWORD=eX933dISQSLT \
-e shared_buffers=512MB \
-e max_wal_size=1500MB \
-e checkpoint_completion_target=0.9 \
-e synchronous_commit=off \
postgres:10.11

#after docking teamcity-server you have to configure it from browser by http://localhost:8111/.
# for installing JBDC driver
#  a) docker container exec -it  tmcs /bin/bash
#  b) cd  /data/teamcity_server/datadir/lib/jdbc
#  c) apt-get install wget
#  d) wget https://jdbc.postgresql.org/download/postgresql-42.2.9.jar

# For employing postgres
#default root username: postgres pwd: eX933dISQSLT (as configured in postgres db container command).
# you will then prompted to create a db user for teamcity if you do not want to do so do
# sudo cat  ~/Workspace/TeamCity/logs/teamcity-server.log and fetch token granting for superuser access


docker container run -d --name tmcs -v ~/Workspace/TeamCity/data/:/data/teamcity_server/datadir -v ~/Workspace/TeamCity/logs/:/opt/teamcity/logs \
--network host -p 8111:8111 \
eyupgurel/teamcity-server:2019.2

#privileged is required to run docker in docker (i.e. if you want to build a container by docker build)
docker container run -d --name tmca1 --privileged -v ~/Workspace/TeamCity/agent/heavypack/:/data/teamcity_agent/conf \
--device /dev/bus/usb:/dev/bus/usb \
--network host -p 9090:9090 \
-e AGENT_NAME=heavypack \
-e SERVER_URL=http://localhost:8111 \
-e DOCKER_IN_DOCKER=start \
eyupgurel/teamcity-android-node-agent:2019.2 bash /run-services.sh

#privileged is required to run docker in docker (i.e. if you want to build a container by docker build)
docker container run -d --name tmca2 --privileged -v ~/Workspace/TeamCity/agent/booster/:/data/teamcity_agent/conf \
--device /dev/bus/usb:/dev/bus/usb \
--network host -p 9091:9090 \
-e AGENT_NAME=booster \
-e SERVER_URL=http://localhost:8111 \
-e DOCKER_IN_DOCKER=start \
eyupgurel/teamcity-node-agent:2019.2 bash /run-services.sh

#privileged is required to run docker in docker (i.e. if you want to build a container by docker build)
docker container run -d --name tmca3 --privileged -v ~/Workspace/TeamCity/agent/connoisseur/:/data/teamcity_agent/conf \
--device /dev/bus/usb:/dev/bus/usb \
--network host -p 9092:9090 \
-e AGENT_NAME=connoisseur \
-e SERVER_URL=http://localhost:8111 \
-e DOCKER_IN_DOCKER=start \
eyupgurel/teamcity-node-agent:2019.2 bash /run-services.sh