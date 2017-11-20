# Implementation with an Ethereum blockchain
### Folders:
- **Coordinator**: First sketch of the Coordinator contract, still under development...
- **Scripts**: Contains useful scripts for Geth to run server and console, unlock an account, compile and deploy a Solidity contract
- **SumWebApp**: Simple example of a blockchain network with a web interface made with Truffle

### Setting up a Geth network:
1. Install necessary packages:
```script
sudo apt-get install software-properties-common
sudo add-apt-repository -y ppa:ethereum/ethereum
sudo apt-get update
sudo apt-get install ethereum solc
```
2. Choose a folder to set up your network and nodes, in the following denoted as `{gethdir}`
3. Make some node folders `{node#}` before configuring the network
4. Add accounts to the nodes by executing following command line in `{gethdir}`:  
`geth --datadir {node#} account new`  
Choose suitable passphrases for the accounts and save the addresses of them!
5. Configure your network with Puppeth (comes with Geth >= 1.6)  
Referring to: https://modalduality.org/posts/puppeth/
6. Init your nodes with your `{testnet}.json` by typing foreach node:  
`geth --datadir {node#} init {testnet}.json`  
Following flags could be added: `--networkid #` for specifying the network ID, `--port #` for specifying the port, `--nodiscover` disables automatic adding, `--maxpeers #` to limit the number of peers, `--rpc` enables the RPC interface and `--rpcport #` specifies the RPC port.  
Note that the RPC flag is important for connecting to the web interface!
7. Once the nodes are initialized, one can start the servers with several commands:  
`geth [flags]`: Starts the Geth server and displays informations.  
`geth [flags] console`: Starts the server with a javascript console, informations will be displayed inbetween the commands.  
`geth [flags] attach ipc:{node#}/geth.ipc`: Attaches a console to an already running server.
8. Play around and test your network!

### Setting up a Truffle web interface:
1. Follow [this](http://www.techtonet.com/how-to-install-and-execute-truffle-on-an-ubuntu-16-04/) for the installation
2. Choose a folder and unpack the webpack demo by: `truffle unbox webpack`
3. Check the port in the `truffle.js` file, it should match the RPC port of your network (later important for migrating the contracts)
4. Adapt the application to your needs by editing the web interface in the `./app` folder and creating new contracts in the `./contracts` folder and adding them to the `./migrations/2_deploy_contracts.js` with:  
`var Contract = artifacts.require("./Contract.sol");`  
`deployer.deploy(Contract);`
5. Run your network or the development network of truffle (`truffel develop`)
6. First compile your contracts `truffle compile`, then migrate them to the network `truffle migrate` and run `truffle deploy`
7. Run the web server with `npm run dev`
8. Play around and improve it!
