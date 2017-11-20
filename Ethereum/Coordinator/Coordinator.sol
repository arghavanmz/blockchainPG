pragma solidity ^0.4.18;

import './FloatMath.sol';

contract Coordinator {
	FloatMath float;
	mapping (address => bytes32) private x; // mapping of node address to the shared resource
	bytes32 public lambda; // public transfer price
	mapping (address => bool) private UPDATE_X; // check foreach node if update of x was made
	uint private ERROR_FLAG; // Indication of errors
	mapping (uint => address) private nodes;
	uint private n; // number of nodes
	//uint private m; // number of shared resources
	uint private iter; // current number of iterations
 
	// Initialize with the addresses of the nodes
    function Coordinator(address[] _nodes) public {
		n = _nodes.length;
		for (uint i = 0; i < n; i++) {
			nodes[i] = _nodes[i];
		}
	}

	// Later initialization for starting the optimizer
	function init() public {
		iter = 0;
		for (uint i = 0; i < n; i++) {
			x[nodes[i]] = float.initFromInt(1);
			UPDATE_X[nodes[i]] = false;
		}
		lambda = float.initFromInt(1);
	}

	function isValidAddress(address _node) private returns (bool) {
		for (uint i = 0; i < n; i++) {
			if (nodes[i] == _node) {
				return true;
			}
		}
		return false;
	}

	function isUpdateComplete() private returns (bool) {
		for (uint i = 0; i < n; i++) {
			if (UPDATE_X[nodes[i]] == false) {
				return false;
			}
		}
		return true;
	}

	function calcNewLambda() private returns (bytes32) {
		// Sum of the states:
		bytes32 sum = float.initFromInt(0);
		for (uint i = 0; i < n; i++) {
			sum = float.add(sum, x[nodes[i]]);
		}
		return float.sub(float.initFromInt(1),float.div(sum,float.initFromInt(int(n)))); // lambda = 1 - sum/n
	}

	function resetFlags() private {
		for (uint i = 0; i < n; i++) {
			UPDATE_X[nodes[i]] = false;
		}
	}

	function updateX(bytes32 _x, uint _iter) public {
		address sender = msg.sender;
		if (isValidAddress(sender) && iter == _iter) {
			x[sender] = _x;
			UPDATE_X[sender] = true;
		}
		if (isUpdateComplete()) {
			lambda = calcNewLambda();
			iter++;
			resetFlags();
		}
	}
}
