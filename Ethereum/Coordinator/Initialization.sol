pragma solidity ^0.4.18;

contract Initialization {
	int public x1; // mapping of node address to the shared resource
	int public lambda; // public transfer price
	//mapping (address => bool) private UPDATE_X; // check foreach node if update of x was made
	address private nodes;
	uint private n; // Number of nodes which participate in the network
    uint private init_n; // Counter for how many nodes are already initialized
	uint private iter; // current number of iterations
    uint private INIT_FLAG; // Indicates that Indication was already completed
 
	// Initialize with the number of nodes
    function Initialization() public {    
		n = 1;          // specify Number of nodes which participate in the network
        init_n = 0; // zero accounts are initialized when contract is initialized 
        INIT_FLAG = 0;  // 
		lambda = 100;	// initial price
	}

	// Initialization for starting the optimizer
	function init(int init_value) public returns (bool) {
        if (INIT_FLAG == 0) { 
            address sender = msg.sender;
            iter = 0;
            for (uint i = 1; i < n; i++) {      // array starts at 0 or 1 ?
                if (nodes == sender) {return false;}   // if sender is already initialized, abort the initialization (maybe add an error message?)
            }
            // after passing this for-loop, we can be sure that the current sender is not yet registered by the contract. Therefore increase init_n:
            init_n++;
            nodes = sender;
            x1 = init_value;
            UPDATE_X[nodes[init_n]] = false;
            // if all nodes have been initialized, compute the inital lambda by using the GlobalOptimization function:
            if (init_n == n) {
                lambda = lambda + x1;
                INIT_FLAG = 1;
            }
        }
        // Maybe add an else-statement here with a reset prompt
        return true;
	}
}