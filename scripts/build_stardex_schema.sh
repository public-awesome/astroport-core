#!/usr/bin/env bash

set -e
set -o pipefail

projectPath=$(cd "$(dirname "${0}")" && cd ../ && pwd)

# List of specific directories to run `cargo schema` on
directories=(
  "$projectPath/contracts/token"
  "$projectPath/contracts/periphery/native_coin_registry"
  "$projectPath/contracts/factory"
  "$projectPath/contracts/pair"
  "$projectPath/contracts/pair_stable"
  "$projectPath/contracts/pair_concentrated"
  "$projectPath/contracts/router"
)

# Loop through the specified directories and run `cargo schema`
for dir in "${directories[@]}"; do
  if [ -d "$dir" ]; then
    (cd "$dir" && cargo schema)
  else
    echo "Directory $dir does not exist"
  fi
done
