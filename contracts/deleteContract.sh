#!/usr/bin/env sh

contractName=$1
deployFolder=../pyscripts
buildFolder=./build

if [ -z "$contractName" ]; then
  echo "Usage: $0 <contractName>"
  exit 1
fi

function safeDelete() {
  if [ -f $1 ]; then
    echo "是否删除文件 $1 ? (y/n)"
    read -r answer
    if [ "$answer" != "y" ]; then
      return
    fi
    rm -f $1
  else
    #echo #"File $1 does not exist"
    echo
  fi
}

#echo text in red color
function echoRed() {
  echo "\033[0;31m$1\033[0m"
}

echoRed "危险操作！！！"

safeDelete "$contractName".sol
safeDelete "$contractName".address
safeDelete "$deployFolder"/deploy_"$contractName".py
safeDelete "$buildFolder"/"$contractName".bin
safeDelete "$buildFolder"/"$contractName".abi


