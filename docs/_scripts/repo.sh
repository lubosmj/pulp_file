#!/usr/bin/env sh
export REPO_NAME=$(head /dev/urandom | tr -dc a-z | head -c5)

echo "Creating a new repository named $REPO_NAME."
export REPO_HREF=$(http POST $BASE_ADDR/pulp/api/v3/repositories/ name=$REPO_NAME \
  | jq -r '._href')

echo "Inspecting repository."
http $BASE_ADDR$REPO_HREF
