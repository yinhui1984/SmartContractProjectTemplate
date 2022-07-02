#!/usr/bin/env sh


killall -9 geth > /dev/null 2>&1

read -r account < ./account.txt
echo "unlock: $account"

read -r port < ./port.txt

geth --datadir ./data/ --networkid 1235 --port "$port"  --http --http.api 'admin,eth,miner,net,txpool,personal,web3'  --mine --allow-insecure-unlock --unlock "$account" --password password.txt
