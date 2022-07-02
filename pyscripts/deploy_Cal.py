#!/usr/bin/env python3

from web3 import Web3  # pip3 install web3
import solcx  # pip3 install py-solc-x

w3 = Web3(Web3.IPCProvider('../mychain/data/geth.ipc'))
print('Connected to Ethereum client: %s' % w3.clientVersion)

src = '../contracts/Cal.sol'
contract_src = open(src).read()
print(contract_src)

compiled_sol = solcx.compile_source(contract_src, output_values=['bin', 'abi'])
contract_interface = compiled_sol['<stdin>:Cal']

Cal = w3.eth.contract(abi=contract_interface['abi'], bytecode=contract_interface['bin'])
w3.eth.default_account = w3.eth.accounts[0]
tx_hash = Cal.constructor().transact()
tx_receipt = w3.eth.waitForTransactionReceipt(tx_hash)
print("tx_receipt:\n %s" % tx_receipt)
print("-----------------------------------------------------")
print("合约地址:" + tx_receipt.contractAddress)

# write the contract address to a file
with open("../contracts/Cal.address", "w") as f:
    f.write(tx_receipt.contractAddress)
    f.close()
