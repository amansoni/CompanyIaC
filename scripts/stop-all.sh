#!/bin/bash
# Stop all Docker Compose services in all subfolders

set -e

# Stop top-level services
if [ -f docker-compose.yml ]; then
  docker compose down
fi

# Stop services in subfolders
for compose in $(find . -name 'docker-compose.yml'); do
  dir=$(dirname "$compose")
  (cd "$dir" && docker compose down)
done

echo "All services stopped."
