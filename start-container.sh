#!/bin/bash

# Colors
RD='\033[0;31m'
GR='\033[0;32m'
YL='\033[0;33m'
BL='\033[0;34m'
NC='\033[0m'

if [ -z "$INPUT_DOCKER_IMAGE" ]; then
  echo "::error::No PHP image provided"
  exit 1
fi

ACTION_IMAGE=""
if [ -n "$PROJECT_IMAGE" ]; then
  echo -e "${BL}Info:${NC} Project image found in env var PROJECT_IMAGE: ${GR}$PROJECT_IMAGE${NC}"
  ACTION_IMAGE="$PROJECT_IMAGE"
fi

if [ -n "$INPUT_DOCKER_IMAGE" ]; then
  echo -e "${BL}Info:${NC} Project image found in input. Using ${GR}$INPUT_DOCKER_IMAGE${NC}"
  ACTION_IMAGE="$INPUT_DOCKER_IMAGE"
fi

if [ -z "$ACTION_IMAGE" ]; then
  echo "::error::No image provided"
  exit 1
fi

echo -e "${BL}Info:${NC} Booting container with image: ${GR}$ACTION_IMAGE${NC}"
docker run \
  -d \
  --name cmds-container \
  --platform linux/amd64 \
  -v "$PWD":/var/www \
  "$ACTION_IMAGE"