# saved commands
docker container run -d --name teamcity-server -v ~/Workspace/TeamCity/data/:/data/teamcity_server/datadir -v ~/Workspace/TeamCity/logs/:/opt/teamcity/logs -p 8111:8111 \
--network host jetbrains/teamcity-server:2017.2.2
    
docker container run -d --name teamcity-agent -v ~/Workspace/TeamCity/agent/:/data/teamcity_agent/conf \
--device /dev/bus/usb:/dev/bus/usb --network host \
-e SERVER_URL=http://localhost:8111 eyupgurel/teamcity-android-agent:2017.2.2

docker container run -d --name teamcity-db -v ~/mount/postgres/teamcity/:/var/lib/postgresql/data \
--network host -p 5432:5432 -e POSTGRES_PASSWORD=eX933dISQSLT postgres:10.2   

docker container run -d --privileged --name android-emulator --net=host \
-e DISPLAY=$DISPLAY \
-v /tmp/.X11-unix:/tmp/.X11-unix -v /usr/lib:/usr/lib \
pinfake/android-emulator-x11

    
# do this before compose this is required for teamcity-server postgresql communication
wget https://jdbc.postgresql.org/download/postgresql-42.2.1.jar
docker container cp postgresql-42.2.1.jar  teamcity-server:/data/teamcity_server/datadir/lib/jdbc
rm postgresql-42.2.1.jar

# do this once this is required for teamcity-server postgresql communication

# teamcity-android
TeamCity server &amp; agent containers for painless setup with Docker for Android Development.

### Basic Setup

```bash
export SERVER_URL=http://<TEAMCITY_SERVER_URL>:8111
docker build -t teamcity-android-agent .
docker-compose up teamcity-server teamcity-agent
```

### Advanced Setup

```bash
# full URL for TeamCity server, accessible by the agent
export SERVER_URL=http://<TEAMCITY_SERVER_URL>:8111

# optional, see: https://confluence.jetbrains.com/display/TCD10/TeamCity+Data+Directory
# default: ~/Workspace/TeamCity/data/
export DATA_PATH=<TEAMCITY_DATA_DIR>

# optional, stores TeamCity server logs
# default: ~/Workspace/TeamCity/logs/
export LOGS_PATH=<TEAMCITY_LOGS_DIR>

# optional, stores TeamCity agent config
# default: ~/Workspace/TeamCity/agent/
export CONF_PATH=<AGENT_CONF_DIR>

# build provided image & start docker containers
docker build -t teamcity-android-agent .
docker-compose up teamcity-server teamcity-agent
```
