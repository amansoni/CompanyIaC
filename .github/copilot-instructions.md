
# Galea Care AI Coding Agent Instructions

## Architecture Overview
	- `services/frontend`: React + Vite PWA, served via Nginx
	- `services/api`: FastAPI backend, multi-tenant, RBAC, JWT auth
	- `auth`: Keycloak (or Authentik) for OAuth2/JWT authentication
	- `database`: PostgreSQL for persistent storage
	- `monitoring`: Alloy config for Grafana Loki log aggregation

## Developer Workflows
	- `make build` (or `docker compose build`)
	- `make up` / `make down` / `make restart`
	- `make test` (runs `pytest` in API container)
	- `npm run dev` in `services/frontend` (Vite dev server)
	- Production build: `npm run build` then serve via Nginx
	- Copy `.env.example` to `.env` and update secrets
	- Alloy config in `monitoring/alloy-config.yml` for Docker log collection
	- Add Loki/Grafana services to `docker-compose.yml` for log/metrics visualization

## Project-Specific Conventions
	- Use semantic HTML5, responsive CSS (`src/index.css`, `src/reset.css`)
	- React components in PascalCase, files in camelCase
	- Entry: `src/main.jsx`, root component: `App.jsx`
	- FastAPI endpoints in `main.py`, JWT auth via Keycloak
	- RBAC and multi-tenancy enforced at endpoint level
	- Only services with `traefik.enable=true` label are routed
	- Domain-based routing via labels in `docker-compose.yml`
	- Live code reload via volume mounts in dev mode
	- Separate build/serve stages in Dockerfiles
	- Use provided targets for build, test, deploy, logs, and environment selection

## Integration Points & External Dependencies
	- Keycloak container (`auth` service) for OAuth2/JWT
	- API expects valid JWTs for protected endpoints
	- PostgreSQL containers for app and Keycloak
	- Alloy, Loki, Grafana (see README for setup)

## Examples
	- Edit `services/api/main.py`, follow FastAPI patterns, enforce JWT/RBAC
	- Create new React component in `services/frontend/src`, import in `App.jsx`
	- Add/modify labels in `docker-compose.yml` for new service

## References
