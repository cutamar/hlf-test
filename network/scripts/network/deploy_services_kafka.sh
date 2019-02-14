#!/bin/bash

GLOBAL_ENV_LOCATION=$PWD/.env
source $GLOBAL_ENV_LOCATION
set -ev 

docker-compose -f "$ZK_COMPOSE_PATH" up -d
sleep 3
docker-compose -f "$KAFKA_COMPOSE_PATH" up -d
sleep 3