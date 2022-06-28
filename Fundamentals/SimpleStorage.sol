// SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

/* 
    To write or update a state variable you need to send a transaction
    So you have to pay gas fee for that update

    On the other hand, you can read state variable without sending a transaction,without any fee

*/

contract SimpleStorage {
    uint256 public num;

    function get() public view returns (uint256) {
        return num;
    }

    function set(uint256 _newValue) public {
        num = _newValue;
    }

    /* 
        If you use get() function inside a function that updates state 
        You need to pay gas for using get()
    */

    function square() public {
        uint256 x = get(); // Costs gas
        num = x**2;
    }
}
