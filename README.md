
# 智能合约项目模板

使用truffle创建编写智能合约项目, 或手动创建智能合约项目 都不是能方便, 每次都有很多重复工作.
所以创建了这个模块, 可以让你在一次性创建智能合约项目的过程中, 就可以把重复的工作都做好.

除了基本的go-eth外, 其中还使用了web3.py  如果你的电脑么有安装, 那么应该首先
+ 安装web3.py:
    `pip3 install web3`
+ 安装py-solc-x:
    `pip3 install py-solc-x`

# 如何使用
下载该模板到任意位置

`make new name=contract-name` : 创建一个新的智能合约, 其会自动生成一个合约文件和合约的部署脚本.

`make run`: 启动测试链, 测试链的默认账户密码以及端口在mychain/account.txt password.txt port.txt中, 无需修改.

`make mine`: 启动按需挖矿,其会在后台轮询,发现有pending的交易时,自动执行挖矿.(防止无效挖矿, 电脑还很烫)

`make build name=contract-name`: 编译智能合约, 生成结果在./contract/build下
`make` 或 `make build-all`: 编译./contract下的所有智能合约, 生成结果在./contract/build下

`make deploy name=contract-name`: 将指定合约部署到测试链.(请先执行 `make run` 和 `make mine`) 部署成功后会生成一个contract-name.address文件保存合约地址.

其它:

`make delete name=contract-name`: 删除指定合约文件和所有相关文件.

`make attach`: attach到控制台

`mychain/renew.sh`: 删除并重新初始化区块链.
