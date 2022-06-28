// SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

/* 
    Constructor is a function that is executed only once when contract is created
    
    Since constructor function is executed creation time you cannot call functions from this contract inside constructor function

    Constructor parameters are ABI-encoded and appended to the end of the creation bytecode

    https://medium.com/coinmonks/solidity-tutorial-all-about-constructors-46a10610336
*/

contract X {
    string public name;

    constructor(string memory _name) {
        name = _name;
    }
}

contract Y {
    string public text;

    constructor(string memory _text) {
        text = _text;
    }
}

// There are 2 ways to initialize parent contract with parameters

// 1) Pass the parameters in inheritance list

contract B is X("Hello"), Y("World") {

}

// 2) Pass the parameters in the constructor
// Constructors are executed in the order of inheritance list

//  X  Y  D
contract D is X, Y {
    constructor() X("Hello") Y("World") {}
}

//  X  Y  E
contract E is X, Y {
    constructor() Y("Hello") X("World") {}
}
