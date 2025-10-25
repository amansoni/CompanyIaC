#!/bin/bash

# Start all Docker Compose services in all subfolders

set -e

# Start top-level services
if [ -f docker-compose.yml ]; then
	docker compose up -d
fi

# Start services in subfolders
for compose in $(find . -name 'docker-compose.yml'); do
	dir=$(dirname "$compose")
	(cd "$dir" && docker compose up -d --build)
done

echo "All services started."
