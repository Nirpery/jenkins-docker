#!/bin/bash

set -e

echo "Stopping containers..."
docker-compose down

IMAGE_NAME="nirpery/passport-api"
IMAGE_TAG="v3"

if docker images --format "{{.Repository}}:{{.Tag}}" | grep -q "^${IMAGE_NAME}:${IMAGE_TAG}$"; then
    echo "Removing image ${IMAGE_NAME}:${IMAGE_TAG}..."
    docker rmi "${IMAGE_NAME}:${IMAGE_TAG}"
else
    echo "Image ${IMAGE_NAME}:${IMAGE_TAG} not found, skipping..."
fi

echo "Building images without cache..."
docker-compose build --no-cache

echo "Starting containers..."
docker-compose up -d

echo "Deployment complete!"