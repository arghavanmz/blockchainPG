pragma solidity ^0.4.18;

contract mortal {
    /* Define variable owner of the type address */
    address owner;

    /* This function is executed at initialization and sets the owner of the contract */
    function mortal() { owner = msg.sender; }

    /* Function to recover the funds on the contract */
    function kill() { if (msg.sender == owner) selfdestruct(owner); }
}

contract SimpleMath is mortal {
	uint public result;
	
	function setResult(uint input1) returns (uint){
		result = input1*input1+1;	
	}	
	
	function outputResult(uint input1) constant returns (uint) {
		setResult(input1);
        return (result);
    }
}
