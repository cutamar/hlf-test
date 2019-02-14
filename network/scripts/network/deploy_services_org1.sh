#!/bin/bash

GLOBAL_ENV_LOCATION=$PWD/.env
source $GLOBAL_ENV_LOCATION
set -ev 

# ORG 1

docker-compose -f "$ORDERER0_COMPOSE_PATH" up -d
sleep 3
docker-compose -f "$SERVICE_ORG1_COMPOSE_PATH" up -d
sleep 3
docker-compose -f "$PEER_ORG1_COMPOSE_PATH" up -d
sleep 3