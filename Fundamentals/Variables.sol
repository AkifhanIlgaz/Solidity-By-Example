// SPDX-License-Identifier: MIT

pragma solidity ^0.8.10;

contract Variables {
    // State Variables
    // They are declared outside a function.
    // They are stored in the contract storage/blockchain
    // Since they are stored in storage, which means that they are using real world sources, using state variables is expensive.

    string public text = "Hello";
    uint256 public num = 123;

    function doSomething() public view {
        // Local Variables
        // They are not stored on the blockchain.
        // Cheaper than state variables.
        uint256 i = 256;

        // Global Variables
        // There are too many global variables which gives us information about blockchain.
        // We will give 2 examples of that. You can go solidityLang for further reading.
        uint256 timestamp = block.timestamp; // Current block timestamp
        address sender = msg.sender; // Address of the caller
    }

    // Constants
    // Constants are variables that cannot be modified.
    // Their values is hardcoded and using constants can save gas.
    // Coding convention to uppercase constant variables.
    address public constant OWNER_ADDRESS =
        0x777788889999AaAAbBbbCcccddDdeeeEfFFfCcCc;
}

contract Immutables {
    // Immutables
    // They are like constants but their value can be set inside constructor but cannot be modified afterwards.
    uint256 public immutable TOTAL_SUPPLY;

    constructor(uint256 _totalSupply) {
        TOTAL_SUPPLY = _totalSupply;
    }
}


