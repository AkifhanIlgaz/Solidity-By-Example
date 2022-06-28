// SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

/* 
    You can explicitly specify the data location of a variable by:
    Storage => Variable is a state variable
    Memory => Variable is accessible while the function is executing
    Calldata => Special data location for function arguments
*/

contract DataLocations {
    uint256[] public arr;
    mapping(uint256 => address) map;
    struct MyStruct {
        uint256 foo;
    }
    mapping(uint256 => MyStruct) myStructs;

    function f() public {
        _f(arr, map, myStructs[1]);

        // Get a struct from mapping
        // Any update on myStruct variable will change the state
        MyStruct storage myStruct = myStructs[1];

        // Create a struct in memory
        // Any update on myNewStruct variable won't change the state
        MyStruct memory myNewStruct = MyStruct(0);
    }

    function _f(
        uint256[] storage _arr,
        mapping(uint256 => address) storage _map,
        MyStruct storage _myStruct
    ) internal {
        // Do something with state variables
    }

    function g(uint256[] memory arr) public returns (uint256[] memory) {
        // arr will be copied to the memory
        // You can play with the arr array inside the function
        // It will use Memory opcodes which is cheaper than Storage opcodes
    }

    function h(uint256[] calldata arr) external {
        // arr will not be copied to the memory
        // Cheaper than memory
        // Read-only => You cannot change arr inside the function
    }
}
