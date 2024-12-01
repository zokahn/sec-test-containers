#!/bin/bash
set -e

# Configuration
IMAGE_NAME="crazy-bad"
IMAGE_TAG="latest"
ARTIFACTORY_REPO="${JFROG_URL}/docker-local"

# Create and use a new builder instance with multi-arch support
echo "Setting up multi-arch builder..."
docker buildx create --name multiarch-builder --use || true
docker buildx inspect multiarch-builder --bootstrap

# Build and push the image for multiple architectures
echo "Building ${IMAGE_NAME} for multiple architectures..."
docker buildx build \
  --platform linux/amd64,linux/arm64 \
  --tag "${ARTIFACTORY_REPO}/${IMAGE_NAME}:${IMAGE_TAG}" \
  --push \
  ../crazy_bad/

# Clean up
docker buildx rm multiarch-builder

echo "Build and push completed successfully!"
