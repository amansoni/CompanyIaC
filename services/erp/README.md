# ERPNext Service Setup

This service runs [ERPNext](https://erpnext.com/) as part of the Galea Care stack. ERPNext sites are managed independently and can be created, started, or stopped using the provided Docker workflow.

## Starting the ERPNext Service

1. **Build and Start Containers**
   Use Docker Compose directly:
    ```sh
    docker compose build
    docker compose up -d
    ```

2. **Access ERPNext**
    - The default site will be available at the configured domain (see `docker-compose.yml` labels).
    - Ensure Traefik routing is enabled (`traefik.enable=true` label).

## Creating a New ERPNext Site

1. **Open a Shell in the ERPNext Container**
    ```sh
    docker compose exec erpnext bash
    ```

2. **Create a New Site**
    ```sh
    bench new-site <site-name>
    ```
    - Follow prompts to set the MariaDB root password and site admin password.

3. **Install ERPNext App**
    ```sh
    bench --site <site-name> install-app erpnext
    ```

4. **Create Site in Bench**
    ```sh
    docker compose exec backend bench new-site erp.dev.local \
  --mariadb-root-password changeit \
  --admin-password admin123 \
  --install-app erpnext
    ```

5. **Update Docker Compose Labels**
    - Add a new label for the site domain in `docker-compose.yml` for Traefik routing.

## Notes

- Environment variables and secrets should be set in `.env` (copy from `.env.example`).
- For production, configure persistent volumes for MariaDB and site files.
- See the main project README for integration with monitoring and authentication.
