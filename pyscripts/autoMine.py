#!/usr/bin/env python3
import os
import time

from web3 import Web3  # pip3 install web3

# 按需挖矿, 避免高CPU占用

w3 = Web3(Web3.IPCProvider('../mychain/data/geth.ipc'))


def main():
    # kill this script
    os.system("killall -9 python > /dev/null 2>&1")

    print('Connected to Ethereum client: %s' % w3.clientVersion)
    print("启动自动挖矿...")
    while True:
        time.sleep(3)
        if w3.eth.getBlock('pending').transactions:
            print(
                time.strftime("%H:%M:%S", time.localtime()) + ":Mining for pending transactions: %s" % w3.eth.getBlock(
                    'pending').transactions)
            w3.geth.miner.start(1)
        else:
            print(time.strftime("%H:%M:%S", time.localtime()) + ':No pending transactions, sleeping...', end='\r')
            w3.geth.miner.stop()


if __name__ == "__main__":
    try:
        main()
    except KeyboardInterrupt:
        print("\n\nCtrl+C, bye!")
        w3.geth.miner.stop()
        exit(0)
    except Exception as e:
        print("发生错误: %s" % e)
        exit(0)
