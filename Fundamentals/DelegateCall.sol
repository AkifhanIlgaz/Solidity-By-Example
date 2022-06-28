// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/* 
    delegatecall is low-level function similar to call.

    When contract A executes delegatecall to contract B :

        Contract B's code executed in the context of Contract A            

    https://noxx.substack.com/p/evm-deep-dives-the-path-to-shadowy-a5f?s=r
    // Go to the link above for further information to learn about how EVM handles with delegatecall

    https://www.youtube.com/watch?v=uawCDnxFJ-0
*/


contract B {
    // NB: The storage layout must be the same as A
    uint public num;
    address public sender;
    uint public value;

    function setVars(uint _num) public payable {
        num = _num;
        sender = msg.sender;
        value = msg.value;
    }    
}

contract A {
    uint public num;
    address public sender;
    uint public value;

    function setVars(address _contract, uint _num) public payable {
        // A's storage is set , B is not affected
        (bool success,) = _contract.delegatecall(abi.encodeWithSignature("setVars(uint256)", _num));
        require(success);
    }
}