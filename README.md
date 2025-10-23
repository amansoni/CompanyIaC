# Xperfecta Infrastructure-as-Code (IaC) Project

This project provides a modular, scalable infrastructure using Docker Compose. It manages core infrastructure, third-party services, and custom products.

## Structure
| Name           | Description                                         |
|----------------|-----------------------------------------------------|
| `infrastructure` | Core infrastructure: networking, proxy, monitoring, authentication, database, and network configuration |
| `services`       | Third-party and custom service containers (frontend, API, ERP, file sharing, project management) |
| `products`       | Internal products and platforms (egrist, galea)    |
| `scripts`        | Automation scripts for setup, backup, restore, migration, health checks, and deployment |
| `docs`           | Project documentation and architecture diagrams    |
| `.env.example`   | Example environment variable file                  |
| `docker-compose.yml` | Main Docker Compose configuration file         |
| `Makefile`       | Build, test, and deployment targets                |


- **infrastructure**: Networking, proxy, monitoring  
   - `nginx`: Reverse proxy configuration  
   - `traefik`: Dynamic routing and SSL termination  
   - `monitoring`: Alloy config, Grafana, Loki for logs/metrics  
   - `auth`: Keycloak/Authentik for authentication  
   - `database`: PostgreSQL for persistent storage  
   - `network`: Custom Docker networks  
- **services**: Third-party apps (erpnext, nextcloud, openproject)
   - `frontend`: React + Vite PWA, served via Nginx  
   - `api`: FastAPI backend with JWT auth and RBAC  
   - `erpnext`: ERP system  
   - `nextcloud`: File sharing and collaboration  
   - `openproject`: Project management platform  
- **products**: Internal products  
   - `egrist`: Mental health assessment platform  
   - `galea`: AI-powered care management  
- **scripts**: Automation and environment setup
   - `setup.sh`: Environment setup and initialization  
   - `backup.sh`: Automated backup for databases and volumes  
   - `restore.sh`: Restore backups to target services  
   - `migrate.sh`: Database migration and schema updates  
   - `healthcheck.sh`: Service health monitoring  
   - `deploy.sh`: Automated deployment workflow  
- **docs**: Documentation and diagrams

## Usage
1. Copy `.env.example` to `.env` and set variables.
2. Run `make up` to start all stacks.
3. See module READMEs for details.
