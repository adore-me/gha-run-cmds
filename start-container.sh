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

echo -e "${BL}Info:${NC} Booting container with image: ${GR}$INPUT_DOCKER_IMAGE${NC}"
docker run \
  -d \
  --name cmds-container \
  --platform linux/amd64 \
  -v "$PWD":/var/www \
  "$INPUT_DOCKER_IMAGE"