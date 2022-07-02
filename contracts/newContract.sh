#!/usr/bin/env sh

contractName=$1
deployFolder=../pyscripts

if [ -z "$contractName" ]; then
  echo "Usage: $0 <contractName>"
  exit 1
fi

#if has file $contractName.sol, replace?
if [ -f "$contractName".sol ]; then
  echo "File $contractName.sol already exists. Overwrite? (y/n)"
  read -r answer
  if [ "$answer" != "y" ]; then
    exit 1
  fi
fi

touch "$contractName".sol



echo "// SPDX-License-Identifier: MIT" > "$contractName".sol
echo "pragma solidity ^0.8.0;" >> "$contractName".sol
echo "" >> "$contractName".sol
echo "contract $contractName {" >> "$contractName".sol
echo "    function add(int a, int b) public pure returns (int) {" >> "$contractName".sol
echo "        return a + b;" >> "$contractName".sol
echo "    }" >> "$contractName".sol
echo "}" >> "$contractName".sol

deployName=deploy_"$contractName".py

cp "$deployFolder"/__DEPLOY_TEMPLE__.py "$deployFolder"/"$deployName"
#replace the contract name in the deploy script
sed -i "" "s/__CONTRACT_NAME__/$contractName/g" "$deployFolder"/"$deployName"



echo Created: $(pwd)/"$contractName".sol
echo Created: $(pwd)/"$deployFolder"/"$deployName"





