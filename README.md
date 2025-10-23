# Galea Care Platform

Galea Care is an open-source, containerized mental health risk assessment platform designed for secure, multi-tenant healthcare organizations. It leverages modern technologies for compliance, scalability, and rapid deployment.

## Features
- **Role-based Access:** Patients, Therapists, and Organization Admins
- **Multi-Organization Support:** Data isolation and tenant-aware access
- **Secure Authentication:** OAuth2/JWT via Keycloak or Authentik
- **Progressive Web App:** Offline assessments, responsive UI
- **Audit Logging & Compliance:** HIPAA/GDPR alignment
- **Scalable & Containerized:** Docker Compose, Traefik, Kubernetes-ready
- **Open-Source Stack:** No proprietary dependencies

## Architecture Overview

```
+-----------+   +---------+   +---------+   +---------+
| Frontend  |<->| Traefik |<->|  API    |<->|  Auth   |
| (React)   |   | Proxy   |   | Gateway |   |Service  |
+-----------+   +---------+   +---------+   +---------+
      |             |             |             |
      v             v             v             v
+-----------+   +---------+   +---------+   +---------+
| Database  |   | Logging |   | Metrics |   | Docker  |
| (Postgres)|   |  ELK    |   |  Loki   |   |Network  |
+-----------+   +---------+   +---------+   +---------+
```

## Technology Stack
- **Frontend:** React + Vite (PWA)
- **API Gateway:** Node.js/Express or FastAPI (multi-tenant, RBAC)
- **Authentication:** Keycloak/Authenik (OAuth2, JWT)
- **Database:** PostgreSQL (encryption at rest/in transit)
- **Reverse Proxy:** Traefik (HTTPS, Let's Encrypt)
- **Logging & Metrics:** ELK Stack (Elasticsearch, Logstash, Kibana) or Grafana Loki + Alloy + Grafana
## Monitoring & Logging: Grafana Loki Alloy Integration

This stack uses Grafana Loki Alloy for log collection and Grafana for visualization.

### Services Added
- **Loki**: Centralized log storage
- **Alloy**: Collects Docker container logs and pushes to Loki
- **Grafana**: Visualizes logs and metrics

### Quick Start
1. Ensure `monitoring/alloy-config.yml` exists (see below).
2. Add the following services to your `docker-compose.yml`:

```yaml
   alloy:
      image: grafana/alloy:latest
      command: --config.file=/etc/alloy/alloy-config.yml
      volumes:
         - ./monitoring/alloy-config.yml:/etc/alloy/alloy-config.yml:ro
         - /var/lib/docker/containers:/var/lib/docker/containers:ro
         - /var/run/docker.sock:/var/run/docker.sock:ro
      networks:
         - galea_net
         - galea_proxy

   loki:
      image: grafana/loki:2.9.2
      ports:
         - "3100:3100"
      command: -config.file=/etc/loki/local-config.yaml
      volumes:
         - ./monitoring/loki-config.yaml:/etc/loki/local-config.yaml:ro
      networks:
         - galea_net
         - galea_proxy

   grafana:
      image: grafana/grafana:10.2.2
      ports:
         - "3000:3000"
      environment:
         - GF_SECURITY_ADMIN_PASSWORD=admin
      networks:
         - galea_net
         - galea_proxy
```

### Example Alloy Config (`monitoring/alloy-config.yml`)
```yaml
server:
   http_listen_port: 12345

integrations:
   docker:
      enabled: true

receivers:
   loki:
      configs:
         - name: docker-logs
            positions:
               filename: /tmp/positions.yaml
            clients:
               - url: http://loki:3100/loki/api/v1/push
            targets:
               - /var/lib/docker/containers/*/*.log
```

### Access Grafana
- Open [http://localhost:3000](http://localhost:3000) in your browser.
- Login with username `admin` and password `admin`.
- Add Loki as a data source (URL: `http://loki:3100`).
- **Deployment:** Docker, Docker Compose

## Quick Start

1. **Clone the repository:**
   ```bash
   git clone https://github.com/your-org/galea-care.git
   cd galea-care
   ```
2. **Configure environment variables:**
   - Copy `.env.example` to `.env` and update secrets.
3. **Build and start services:**
   ```bash
   make build
   make deploy
   ```
4. **Access the platform:**
   - Frontend: https://localhost/
   - Keycloak/Authenik: https://localhost/auth/
   - API: https://localhost/api/

## Local Development Setup (2025)

- **Frontend:** Runs on Vite dev server (port 8000), routed via Traefik at http://app.dev.local/
- **API:** FastAPI backend, routed at http://api.dev.local/
- **Auth:** Keycloak at http://auth.dev.local/
- **Monitoring:** Grafana at http://logs.dev.local/
- **Networks:** Uses external Docker networks (`galea_proxy`, `galea_net`) for service discovery
- **Volumes:** Frontend uses a named volume for `node_modules` to avoid overwriting dependencies when mounting source code

### Quick Start (Dev)
1. Create external Docker networks (if not present):
   ```bash
   docker network create galea_proxy
   docker network create galea_net
   ```
2. Build and start services:
   - Main stack (API, frontend, auth, traefik):
     ```bash
     docker compose -f services/docker-compose.yml up -d --build
     ```
   - Monitoring stack (Grafana, Loki, Alloy):
     ```bash
     docker compose -f monitoring/docker-compose.yml up -d --build
     ```
3. Access services:
   - Frontend: http://app.dev.local/
   - API: http://api.dev.local/
   - Auth: http://auth.dev.local/
   - Grafana: http://logs.dev.local/

#### Compose File Overview
- `services/docker-compose.yml`: Main application stack (frontend, API, auth, traefik)
- `monitoring/docker-compose.yml`: Monitoring stack (Grafana, Loki, Alloy)
- `monitoring/alloy-config.yml`: Alloy log collector config
- `traefik/traekif.yml`: Traefik static/dynamic config

### Frontend Dev Notes
- Vite dev server runs in Docker, exposed on port 8000
- Traefik routes requests to frontend at `app.dev.local`
- Source code is bind-mounted, but `node_modules` uses a named volume (`frontend_node_modules`) to persist dependencies
- If you see `Vite: not found` or missing dependencies, check the volume configuration in `docker-compose.yml`
- For 403 errors on frontend, ensure Vite config allows external access (see `vite.config.js` for `host`, `cors`, and `hmr` settings)

### Monitoring Stack
- Alloy collects Docker logs and pushes to Loki
- Grafana visualizes logs and metrics

## Database Schema
- **Organizations:** `id`, `name`, `domain`, `settings`
- **Users:** `id`, `auth_id`, `organization_id`, `role`, `status`, `created_at`
- **Assessments:** `id`, `user_id`, `organization_id`, `responses`, `score`, `risk_level`, `created_at`

## Security & Compliance
- HTTPS enforced via Traefik/Let's Encrypt
- Data encrypted at rest (pgcrypto) and in transit (SSL)
- Role-based access and audit logging
- Configurable data retention/export

## DevSecOps
- CI/CD pipeline with security scans, image signing, automated deploys
- Example Makefile:
  ```makefile
  build:
  	docker compose build

  test:
  	docker compose run api npm test

  deploy:
  	docker compose up -d
  ```

## Contributing
Open-source contributions are welcome! Please submit issues and pull requests via GitHub.

## License
MIT License. See [LICENSE](LICENSE) for details.

## Contact
For questions or support, contact your-org@example.com.

## Traefik HTTPS & Dashboard Setup

- Traefik now uses static self-signed TLS certificates for HTTPS. Configure in `traefik/traefik.yml`:
  ```yaml
  tls:
    certificates:
      - certFile: "/etc/traefik/certs/local-cert.pem"
        keyFile: "/etc/traefik/certs/local-key.pem"
  ```
- Dashboard is exposed at `https://proxy.dev.local/dashboard/` via router labels in the traefik service in `docker-compose.yml`.
- If you see TLS errors, ensure the certs are referenced and mounted correctly, and your browser trusts `local-cert.pem`.
- After changes, restart Traefik:
  ```bash
  docker compose up -d --build traefik
  ```
