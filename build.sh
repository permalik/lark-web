#!/usr/bin/env bash
set -e

if [ -z "$1" ]; then
  echo "Usage: $0 <tag>"
  exit 1
fi

IMAGE_NAME=lark_web
TAG=$1

echo "Building Docker image with tag: $TAG (no cache)..."
docker build --no-cache -t "$IMAGE_NAME:$TAG" .

echo "Build complete: $TAG"
