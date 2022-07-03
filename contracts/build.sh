#!/usr/bin/env sh

buildFolder=./build


if [ -z "$1" ]; then
  #find all .sol files in the current folder and sub-folders
  solFiles=$(find . -name "*.sol" -print0 | xargs -0 -n1 basename)
  #echo "solFiles: $solFiles"
  for solFile in $solFiles; do
    #echo "solFile: $solFile"
    contractName=$(basename "$solFile" .sol)
    solc --bin --abi --optimize --overwrite -o "$buildFolder" "$contractName".sol
    if [ $? -ne 0 ]; then
      echo "Error compiling $contractName"
      exit 1
    fi
  done
else
  solc --bin --abi --overwrite  -o "$buildFolder" "$1".sol
fi


