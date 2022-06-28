// SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

/*
    Constant variables cannot be modified 
    Value of constant variable is hard-coded to contract's bytecode
    Therefore, there is no memory or storage access
    It means that using constants can save gas

    Naming convention to uppercase constant variables
*/

contract Constants {
    // The address of Uniswap Factory contract
    address public constant FACTORY_ADDRESS =
        0x5C69bEe701ef814a2B6a3EDD4B1652CB9cc5aA6f;

    uint256 public constant FEE = 2;
}
