# Useful scripts and commands
## run
Run directly 4 terminals with 2 separated servers and 2 attached consoles. Just type in the script directory:
```bash
bash run
```

## Connect two nodes
Get the enode info from the 2nd console with `admin.nodeInfo.enode`, copy the enode string and execute in the 1st console `admin.addPeer({enodeString})`

## unlock.js
Unlocks an account sets it as the default account and starts the mining. Just type into the javascript console:
```javascript
loadScript("unlock.js")
```

## compile
This script is for compiling a contract. It is executed by `bash compile contract` where `contract` represents the filename ("contract.sol") of the contract which will be compiled. The output will be a Javascript file which can be executed in a console to deploy the contract.

## contract.js
The script of the compiled contract contains several informations. The ABI and BIN code and an instance of the contract. For loading the information into the console, just load the script by `loadScript("contract.js")`. For deploying the contract into the testnetwork you have to follow these steps:
1. Unlock the base account by `personal.unlockAccount(eth.coinbase)`
2. Start the mining process by `miner.start()`
3. Create a new Instance of the contract:
```javascript
var contract = contractContract.new("Could be an argument...",{from: eth.coinbase, data: contractBin, gas: 1000000})
```
At first parameter(s) you could give the new instance arguments and after that you have to define from who is the smart contract, what is the data (BIN code) and how much does it cost to execute the contract.
