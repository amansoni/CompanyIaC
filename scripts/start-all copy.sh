#!/bin/bash

## Infrastructure stack
docker compose -f 'infrastructure/docker-compose.yml' up -d --build
docker compose -f 'infrastructure/monitoring/docker-compose.yml' up -d --build
docker compose -f 'infrastructure/registry/docker-compose.yml' up -d --build

## Services stacks
docker compose -f 'services/analytics/docker-compose.yml' up -d --build
docker compose -f 'services/erp/docker-compose.yml' up -d --build 
docker compose -f 'services/integration/docker-compose.yml' up -d --build
# docker compose -f 'services/project/docker-compose.yml' up -d --build
# docker compose -f 'services/social/docker-compose.yml' up -d --build
docker compose -f 'services/storage/docker-compose.yml' up -d --build

## Products stacks
docker compose -f 'products/egrist/docker-compose.yml' up -d --build
docker compose -f 'products/galea/docker-compose.yml' up -d --build
