#!/bin/bash
GLOBAL_ENV_LOCATION=$PWD/.env
source $GLOBAL_ENV_LOCATION

set -ev

docker-compose -f "$ORDERER1_COMPOSE_PATH" up -d
sleep 3
docker-compose -f "$SERVICE_ORG2_COMPOSE_PATH" up -d
sleep 3
docker-compose -f "$PEER_ORG2_COMPOSE_PATH" up -d

