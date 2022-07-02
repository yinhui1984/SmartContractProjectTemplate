#!/usr/bin/env sh

contractName=$1
deployFolder=../pyscripts

if [ -z "$contractName" ]; then
  echo "Usage: $0 <contractName>"
  exit 1
fi



cd "$deployFolder"
python3 ./deploy_"$contractName".py

