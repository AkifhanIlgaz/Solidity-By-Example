// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/* 
    When a function is called, the first 4 bytes of calldata specifies which function to call

    This 4 bytes is called function selector

    Function selector is first 4 bytes (left, higher order) of keccak256 hash of function canonical expression

    bytes4(keccak256("functionName(argType,argType,...)"))  No spaces !!!

    https://blog.openzeppelin.com/deconstructing-a-solidity-contract-part-iii-the-function-selector-6a9b6886ea49/

    https://noxx.substack.com/p/evm-deep-dives-the-path-to-shadowy?s=r

*/


contract FunctionSelector {

    /*
    "transfer(address,uint256)"
    0xa9059cbb
    "transferFrom(address,address,uint256)"
    0x23b872dd
    */

    function getSelector(string calldata _func) public pure returns(bytes4) {
        return bytes4(keccak256(abi.encodePacked(_func)));
    }
}