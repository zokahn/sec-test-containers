#!/bin/bash
set -e

# Configuration
IMAGE_NAME="nodejs-app"
IMAGE_TAG="latest"
#ARTIFACTORY_REPO="your-docker-repo"
ARTIFACTORY_REPO=${JFROG_REPO}

# Create and use a new builder instance with multi-arch support
echo "Setting up multi-arch builder..."
docker buildx create --name multiarch-builder --use || true
docker buildx inspect multiarch-builder --bootstrap

# Build the image for multiple architectures
echo "Building ${IMAGE_NAME} for multiple architectures..."
docker buildx build \
  --platform linux/amd64,linux/arm64 \
  --tag ${IMAGE_NAME}:${IMAGE_TAG} \
  --load \
  ../nodejs-app/

# Tag for Artifactory
ARTIFACTORY_IMAGE="${JFROG_URL}/${ARTIFACTORY_REPO}/${IMAGE_NAME}:${IMAGE_TAG}"
docker tag ${IMAGE_NAME}:${IMAGE_TAG} ${ARTIFACTORY_IMAGE}

# Login to Artifactory
echo "Logging into Artifactory..."
echo "${JFROG_PASS}" | docker login ${JFROG_URL} -u ${JFROG_USER} --password-stdin

# Push to Artifactory
echo "Pushing to Artifactory..."
docker push ${ARTIFACTORY_IMAGE}

# Clean up
docker buildx rm multiarch-builder

echo "Build and push completed successfully!"
