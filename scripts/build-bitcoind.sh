#!/bin/bash
set -e

# Configuration
IMAGE_NAME="bitcoind"
IMAGE_TAG="latest"
ARTIFACTORY_REPO="your-docker-repo"

# Build the image
echo "Building ${IMAGE_NAME}..."
docker build -t ${IMAGE_NAME}:${IMAGE_TAG} ../bitcoind/

# Tag for Artifactory
ARTIFACTORY_IMAGE="${JFROG_URL}/${ARTIFACTORY_REPO}/${IMAGE_NAME}:${IMAGE_TAG}"
docker tag ${IMAGE_NAME}:${IMAGE_TAG} ${ARTIFACTORY_IMAGE}

# Login to Artifactory
echo "Logging into Artifactory..."
echo "${JFROG_PASS}" | docker login ${JFROG_URL} -u ${JFROG_USER} --password-stdin

# Push to Artifactory
echo "Pushing to Artifactory..."
docker push ${ARTIFACTORY_IMAGE}

echo "Build and push completed successfully!"
