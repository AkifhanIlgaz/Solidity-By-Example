// SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

/* 
    Events are used for:

        Listening for events and updating user interface
        A cheap form of storage
        
*/

contract Events {
    // Up to 3 parameters can be indexed
    // Indexed parameters helps you filter the logs by the indexed parameter
    event Log(address indexed sender, string message);
    event AnotherLog();

    function f() public {
        emit Log(msg.sender, "Hello Solidity");
        emit Log(msg.sender, "Hello EVM");
        emit AnotherLog();
    }
}
