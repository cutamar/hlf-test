#!/bin/bash
GLOBAL_ENV_LOCATION=$PWD/.env
source $GLOBAL_ENV_LOCATION

set -ev

# ORG 3
docker-compose -f "$ORDERER2_COMPOSE_PATH" up -d
sleep 3
docker-compose -f "$SERVICE_ORG3_COMPOSE_PATH" up -d
sleep 3
docker-compose -f "$PEER_ORG3_COMPOSE_PATH" up -d

