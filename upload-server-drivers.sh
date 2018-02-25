#!/usr/bin/env bash

wget https://jdbc.postgresql.org/download/postgresql-42.2.1.jar
docker container cp postgresql-42.2.1.jar  teamcity-server:/data/teamcity_server/datadir/lib/jdbc
rm postgresql-42.2.1.jar

