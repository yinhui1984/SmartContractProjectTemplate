#!/usr/bin/env sh

function echoRed() {
  echo "\033[0;31m$1\033[0m"
}

echoRed "危险操作！！！ 该操作会删除并重新初始化区块链，请确认是否继续？(y/n)"
read -r answer
if [ "$answer" != "y" ]; then
  exit 1
fi

echo 停止geth
killall -9 geth

echo 停止自动挖矿
pid=$(ps -ef | grep autoMine.py | grep -v grep | awk '{print $2}')
if [ -n "$pid" ]; then
  kill -9 $pid
fi


rm -rf ./data/geth

geth --datadir ./data init ./genesis.json