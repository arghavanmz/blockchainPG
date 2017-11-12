#	Setting up a network using Puppeth 
CAUTION!!! : this is only a starting point for the puppeth Docu. It has gaps and is totally not(!) complete. Working again on this documentation is absolutely necessary in the future.

## System Prerequesites

## Step 1: Install newest Geth-Version
Currently Geth1.6
...

## Step 2: Create directory structure
Create an overall folder where the network should be located: e.g. "TestNet"
Then create the subfolders: "Node1", "Node2" and "Node3"

## Step 3: Create 3 accounts
Open a terminal in the TestNet folder and type in the following commands.
You will be asked for entering a password to secure the accounts.
> $ geth --datadir Node1 account new
> $ geth --datadir Node2 account new
> $ geth --datadir Node3 account new
You will get the addresses of the accounts as outputs in the command line.

## Step 4: Create a GenesisFile with Puppeth
> $ puppeth
> Please specify a network name to administer (no spaces, please)
> > TestNet
> What would you like to do? (default = stats)
> 1. Show network stats
> 2. Configure new genesis
> 3. Track new remote server
> 4. Deploy network components
> > 2
> Which consensus engine to use? (default = clique)
> 1. Ethash - proof-of-work
> 2. Clique - proof-of-authority
> > ...
> How many seconds should blocks take? (default = 15)
> > ...
> Which accounts are allowed to seal? (mandatory at least one)
> > 0x{ADDR1}
> > 0x{ADDR2}
> > 0x{ADDR3}
> > 0x<ENTER>
> Which accounts should be pre-funded? (advisable at least one)
> > 0x{ADDR1}
> > 0x{ADDR2}
> > 0x{ADDR3}
> > 0x<ENTER>
> Specify your chain/network ID if you want an explicit one (default = random)
> > <ENTER>
> Anything fun to embed into the genesis block? (max 32 bytes)
> > <ENTER>
> What would you like to do? (default = stats)
> 1. Show network stats
> 2. Save existing genesis
> 3. Track new remote server
> 4. Deploy network components
> > 2
> Which file to save the genesis into? (default = testnet.json)
> > <ENTER>
> What would you like to do? (default = stats)
> 1. Show network stats
> 2. Save existing genesis
> 3. Track new remote server
> 4. Deploy network components
> > <CTRL-C>

## Step 5: Open the servers
Open 3 different terminals in the folder "TestNet" and type one of these commands in each of the terminals:
> > sudo geth --datadir Node1 --port 3000
> > sudo geth --datadir Node2 --port 3002
> > sudo geth --datadir Node3 --port 3004

## Step 6: Open the consoles
Open 3 different terminals in the folder "TestNet" and type one of these commands in each of the terminals:
> > sudo geth attach ipc:Node1/geth.ipc
> > sudo geth attach ipc:Node2/geth.ipc
> > sudo geth attach ipc:Node3/geth.ipc

## Step 7: Connect the nodes
In the consoles of Node2 and Node3 type:
> > admin.nodeInfo.enode
Note down the addresses which are shown in the consoles
Then, in the console of Node1 type:
> > admin.addPeer({enodeString})
enodeString is the placeholder for the addresses you just noted down from the other consoles.

## Step 8: Unlock the accounts
Type in each of the 3 consoles (from Step 6) the following command to unlock the account:
> > personal.unlockAccount(eth.coinbase)

## Step 9: Start the mining
Type in each (or some) of the consoles the following command to start the mining:
> > miner.start()
The mining can later be stopped by typing `miner.stop()`
