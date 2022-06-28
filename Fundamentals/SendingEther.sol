// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/* 

    How to send Ether ? 

        - Transfer => 2300 gas, throws error
        - Send => 2300 gas, returns bool
        - Call => forward all gas or set gas, returns bool

    How to receive Ether ? 

        - fallback() external payable
        - receive() external payable

       
    Which function is called, fallback() or receive()?

                send Ether
                    |
            msg.data is empty?
                / \
              yes  no
              /     \
receive() exists?  fallback()
        /   \
      yes   no
      /      \
  receive()   fallback()
            


    Which method you should use ?

    - Using 'call' method is recommended after December 2019 because of increasing the cost of some opcodes

    - But you must use 'call' in combination with re-entrancy guard

    Guard against re-entrancy by

     - Check - Effect - Interaction
     - Re-entrancy guard modifier

*/

contract ReceiveEther {
    
    // Function to receive Ether
    // msg.data must be empty
    receive() external payable {}


    // Fallback function is called when msg.data is not empty
    fallback() external payable {}


    function getBalance() public view returns(uint) {
        return address(this).balance;
    }
}


contract SendEther {

    function sendViaTransfer(address _to) public payable {
        // This function is not recommended for sending Ether   
        payable(_to).transfer(msg.value);
    }

    function sendViaSend(address _to) public payable {
        // "send" will return boolean value
        // This function is not recommended for sending Ether  
        bool sent = payable(_to).send(msg.value);
        require(sent);
    }

    function sendViaCall(address _to) public payable {
        // "call"  will return boolean value and return value
        // This is the current recommended method for sending Ether   
        (bool success, bytes memory data) = payable(_to).call{value: msg.value}("");
        require(success);
    }
}