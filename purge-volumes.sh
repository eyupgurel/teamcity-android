#!/usr/bin/env bash
# usage: sudo sh purge-volumes.sh

USER=/home/cyrus
TEAMCITY_SRV_DATADIR=${USER}/Workspace/TeamCity/data/
TEAMCITY_SRV_LOGDIR=${USER}/Workspace/TeamCity/logs/
TEAMCITY_AGENT_CONFDIR=${USER}/Workspace/TeamCity/agent/
TEAM_CITY_DB_DATADIR=${USER}/mount/postgres/teamcity/

#if absent make volumes directories
rm -rf ${TEAMCITY_SRV_DATADIR}
rm -rf ${TEAMCITY_SRV_LOGDIR}
rm -rf ${TEAMCITY_AGENT_CONFDIR}
rm -rf ${TEAM_CITY_DB_DATADIR}

