# Galea Care Makefile

.PHONY: build test up down restart logs

build:
	docker compose build

test:
	docker compose run --rm api pytest

up:
	docker compose up -d

down:
	docker compose down

restart:
	docker compose down && docker compose up -d

logs:
	docker compose logs -f

# Production build (with env file)
prod:
	ENV=production docker compose --env-file .env up -d --build

# Development build (default)
dev:
	ENV=development docker compose --env-file .env up -d --build
