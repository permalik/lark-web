#!/usr/bin/env bash
set -e

if [ -z "$1" ]; then
  echo "Usage: $0 <tag>"
  exit 1
fi

TAG=$1
LOCAL_IMAGE="lark_web:$TAG"
REMOTE_IMAGE="ghcr.io/permalik/lark_web:$TAG"

if [ -z "$GHCR_PAT" ]; then
  echo "Error: GHCR_PAT environment variable not set."
  echo "Please export your GitHub personal access token first:"
  echo "  export GHCR_PAT=your_token_here"
  exit 1
fi

echo "Logging into GitHub Container Registry..."
echo "$GHCR_PAT" | docker login ghcr.io -u permalik --password-stdin

echo "Tagging image as $REMOTE_IMAGE..."
docker tag "$LOCAL_IMAGE" "$REMOTE_IMAGE"

echo "Pushing image to GHCR..."
docker push "$REMOTE_IMAGE"

echo "Successfully deployed $REMOTE_IMAGE"
