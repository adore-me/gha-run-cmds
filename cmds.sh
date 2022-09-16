#!/bin/bash

# Colors
RD='\033[0;31m'
GR='\033[0;32m'
YL='\033[0;33m'
BL='\033[0;34m'
NC='\033[0m'

if [ "$INPUT_RUN_ROUTE_CACHE" == "true" ]; then
  echo -e "${BL}Info:${NC} Running laravel route caching.."
  docker exec php bash -c "php artisan route:cache"
fi

if [ -n "$INPUT_CUSTOM_CMDS" ]; then
  echo -e "${BL}Info:${NC} Running custom commands.."
  readarray -t <<<"$INPUT_CUSTOM_CMDS"

  for (( i=0; i<${#MAPFILE[@]}; i++ ))
  do
      if [ -n "${MAPFILE[$i]}" ]; then
        echo -e "${BL}Info:${NC} Running command: ${GR}${MAPFILE[$i]}${NC}"
        docker exec php bash -c "${MAPFILE[$i]}"
      fi
  done
fi