// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/* 
    Functions and addresses declared as payable can receive Ether

    **** Non-Payable Check Opcode ****
    
  00  CALLVALUE
  01  DUP1
  02  ISZERO
  03  PUSH2 0X000B
  06  JUMPI
  07  PUSH1 0X00
  09  DUP1
  0A  REVERT
  0B  JUMPDEST

    Functions are non-payable by default.
    If you don't know specify that the function is payable bytecode will check if callvalue is zero
    If it is not reverts the execution.

*/

contract Payable {
    // Payable addresses can receive Ether
    address payable public owner;

    // Payable constructor can receive Ether
    constructor() payable {
        owner = payable(msg.sender);
    }

    // If you call deposit() with some Ether
    // Balance of contract will be automatically updated    
    function deposit() public payable {}



    // If you call notPayable() with some Ether
    // The function will throw an error 
    function notPayable() public {}


    // Function to withdraw all Ether in this contract
    function withdraw() public {
        uint amount = address(this).balance;

        // Send all Ether to the owner
        // Since we declared owner address as payable 
        // 'owner' can receive ether

        (bool success,) = owner.call{value: amount}("");
        require(success, "Failed to send Ether to the owner");
    }


    // Function to transfer Ether from this contract to another address
    function transfer(address _to, uint _amount) public {
        // In order to send Ether to (_to) address we need to declare it as payable
        (bool success, ) = payable(_to).call{value: _amount}();
        require(success);
    }
}