// SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

// Modifier is a piece of code that can run before and/or after the function

// Modifiers are very useful in Solidity

/* 
    Restrict Access 
    Validate Inputs
    Guard against reentrancy attacks
*/

// We'll implement modifiers for these use cases

contract Modifier {
    address public owner;
    uint256 public x = 10;
    bool public locked;

    constructor() {
        owner = msg.sender;
    }

    // Modifier to check that the caller of function is the owner

    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner!");
        // _; is special for modifiers in Solidity
        // It tells the Solidity to execute the rest of the function code
        _;
    }

    // Modifiers can take parameters like functions
    // Modifier to check that the given address is not zero address
    modifier validAddress(address _address) {
        require(_address != address(0), "Not valid address");
        _;
    }

    // Modifier to check that the given address is not a contract

    modifier notContract(address _address) {
        uint256 codeSize;

        assembly {
            codeSize := extcodesize(_address)
        }

        // require(_address.code.length == 0)
        require(codeSize == 0, "The caller is a contract");
        _;
    }

    function changeOwner(address _newOwner) external onlyOwner {
        owner = _newOwner;
    }

    function mint(uint256 _id) external notContract(msg.sender) {
        // A contract cannot mint NFT
    }

    modifier noReentrancy() {
        require(!locked, "No reentrancy");
        locked = true;
        _;
        locked = false;
    }

    function decrement(uint256 _i) public noReentrancy {
        x -= _i;

        if (_i > 1) {
            decrement(_i - 1);
        }
    }
}
