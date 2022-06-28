// SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

/*
    Immutables are just like constants

    Value of immutable can be modified in constructor
    Afterwards cannot be modified

    Coding Convention => Uppercase

*/

contract Immutable {
    address public SWAP_ADDRESS;
    uint256 public FEE;

    constructor(address _swapAddress, uint256 _fee) {
        SWAP_ADDRESS = _swapAddress;
        FEE = _fee;
    }
}
