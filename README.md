# Xperfecta Infrastructure-as-Code (IaC) Project

An Infrastructure as Code (IaC) project using Docker Compose can provide a modular, scalable infrastructure combining networking, monitoring, automation, document storage, project management, ERP, analytics, and posting tools.

## Service Endpoints

- [Analytics](https://analytics.sublimecyb.org)
- [Auth](https://auth.sublimecyb.org)
- [Chat](https://chat.sublimecyb.org)
- [Docs](https://docs.sublimecyb.org)
- [ERP](https://erp.sublimecyb.org)
- [Monitor](https://monitor.sublimecyb.org)
- [Portainer](https://portainer.sublimecyb.org)
- [Project](https://project.sublimecyb.org)
- [Social](https://social.sublimecyb.org)
- [Traefik](https://traefik.sublimecyb.org)


### Primary Components and Their Roles

- **Traefik**: Dynamic reverse proxy, handles routing, SSL certificates, and load balancing for the entire stack.
- **Keycloak**: Provides Single Sign-On (SSO), central identity management, and secure authentication flows.
- **Grafana Loki & Alloy**: Aggregates logs for analysis and troubleshooting. Alloy acts as a unified telemetry agent, collecting logs and metrics from all containers and forwarding them to Loki and Grafana for centralized visualization.
- **Uptime Kuma**: Monitors uptime and availability, sending real-time alerts if services go down.

### Additional Services

- **Nextcloud**: Secure file storage, sharing, collaboration, and productivity features with a plugin ecosystem.
- **n8n**: Low-code workflow automation and integrations between apps and services.
- **OpenProject**: Comprehensive project management with Gantt charts, time tracking, and agile support.
- **ERPNext**: Full-featured ERP system supporting HR, CRM, accounting, inventory, manufacturing, and more.
- **Matomo**: Self-hosted web analytics platform, private and GDPR-compliant alternative to Google Analytics.
- **Postiz**: Social posting and scheduling platform for marketing and communications teams.

***

### Key Features

- Automated deployments and updates for all services.
- Centralized authentication and access control.
- Unified logging, metrics, and monitoring.
- Real-time uptime and status alerts.
- Highly extensible, open-source tools.

***

### Benefits

- Rapid and reproducible deployments.
- Easier scaling, backup, and disaster recovery.
- Centralized visibility and faster troubleshooting.
- Reduced vendor lock-in and privacy risk.
- Easy integration and automation between business tools.

***

### Common Usage Scenarios

- Internal and external teams use single sign-on and shared file access.
- Developers and IT monitor service health and log data.
- Project and business units manage tasks and operations.
- Marketing teams analyze web traffic and schedule campaigns.
- All services are secured, monitored, and accessed from one stack.

***

This approach creates a full-featured, self-hosted, and highly maintainable infrastructure for modern organizations.

[1](https://grafana.com/docs/learning-journeys/send-traces-alloy/value-of-traces-and-alloy/)
[2](https://betterstack.com/community/comparisons/traefik-monitoring-tools/)
[3](https://devopscube.com/grafana-loki-architecture/)
[4](https://www.reddit.com/r/Traefik/comments/1dsuzz9/monitor_traefik_with_grafana_prometheus_loki/)
[5](https://cloudpap.com/blog/uptime-kuma-and-grafana/)
[6](https://www.youtube.com/watch?v=E654LPrkCjo)
[7](https://grafana.com/docs/enterprise-logs/latest/send-data/alloy/)
[8](https://www.paulsblog.dev/use-docker-uptime-kuma-and-traefik-to-monitor-your-website/)
[9](https://github.com/vtatarin/lgtm)
[10](https://www.reddit.com/r/devops/comments/129vxcz/what_are_you_favorite_dashboard_tools_stack_and/)