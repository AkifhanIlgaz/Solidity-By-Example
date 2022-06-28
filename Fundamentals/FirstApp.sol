// SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

contract Counter {
    uint256 public count;

    // Function to get the value of count variable
    // Since our variable is declared as public we don't need to write that function to retrieve the value of count
    // If a variable is declared public a getter function is automatically implemented
    // count() is the getter function for 'count' variable
    function getCount() public view returns (uint256) {
        return count;
    }

    // Function to increment the value of 'count' by 1
    function increment() public {
        count++;
    }

    // Function to decrement the value of 'count' by 1
    function decrement() public {
        // Since Solidity 0.8.0 compiler checks for overflow/underflow
        // So, if count = 0 this function will fail
        count--;
    }
}
