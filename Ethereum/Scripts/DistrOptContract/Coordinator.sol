pragma solidity ^0.4.18;

contract mortal {
    /* Define variable owner of the type address */
    address owner;

    /* This function is executed at initialization and sets the owner of the contract */
    function mortal() { owner = msg.sender; }

    /* Function to recover the funds on the contract */
    function kill() { if (msg.sender == owner) selfdestruct(owner); }
}

contract Coordinator is mortal {
	uint public x1;		// can this be changed to private?
	uint public x2;		// can this be changed to private?
	uint public lambda;	
	uint public FLAG_X1_NEW;	// can this be changed to private? bool doesnt work somehow. needs to be revised
	uint public FLAG_X2_NEW;	// can this be changed to private?
	uint public FLAG_LAMBDA_NEW;	// This flag might be used by the webpage for indication that lambda was updated
	uint public FLAG_ERROR_OCCURED;	// This flag might be used by the webpage for indication that sth weird happend
    address public ADDR1;	// can this be changed to private?
    address public ADDR2; 	// can this be changed to private?
    address public ADDRsender; 	// can this be changed to private?
 
    

	
	function getSender(){
		ADDRsender = msg.sender;
		// Capital letters needed:
		ADDR1 = 0x9D73BB2414ECDE4E57123A5F52ADE56058A7B999;
		ADDR2 = 0x4AEF503327B30A448F05CB87621820F64AEEB7D3;
	}


    function setValue(uint _input) returns (bool){
		getSender();
        // These if statements set the resource variables according to the address of the sender
        if(ADDRsender == ADDR1) {
            x1 = _input;
            FLAG_X1_NEW = 1;
            FLAG_LAMBDA_NEW = 0;
			}
		else if(ADDRsender == ADDR2) {
			x2 = _input;
			FLAG_X2_NEW = 1;
			FLAG_LAMBDA_NEW = 0;
			}
		else {
			FLAG_ERROR_OCCURED = 1;
			return false;
			}
		
		// This if-statement is executed if both resource variables were updated. Else: Do nothing
		if(FLAG_X1_NEW == 1 && FLAG_X2_NEW == 1) {
			lambda = x1 + x2;
			FLAG_LAMBDA_NEW = 1;
			FLAG_X1_NEW = 0;
			FLAG_X2_NEW = 0;
			return true;
			}
		else {return true;}
	}
   
}
