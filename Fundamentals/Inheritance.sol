// SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

/* 
    In Solidity, contracts behave like classes in OOP, therefore, they can inherit or be inherited

    In order to inherit from another contract use 'is' keyword

*/

/*
    Virtual => The function can be overridden
    Override => The function is being overridden
*/

contract A {
    function foo() public pure virtual returns (string memory) {
        return "A";
    }
}

contract B is A {
    // Overrides A.foo()
    function foo() public pure virtual override returns (string memory) {
        return "B";
    }
}

contract C is A {
    // Overrides A.foo()
    function foo() public pure virtual override returns (string memory) {
        return "C";
    }
}

/*
    Solidity supports multiple inheritance

    When a function is called that is defined multiple times in parent contracts
    parent contracts are searched from right to left(depth-first)

    'super' => Go one level up in inheritance order call that function from that contract

    'super' use JUMP opcodes internally,not message calls

*/

contract D is B, C {
    // D.foo() returns C.foo()
    // C is the most derived (right most) contract in inheritance order
    function foo() public pure virtual override(B, C) returns (string memory) {
        return super.foo();
    }
}

/*
    If your contract inherits from multiple contracts:
    Inheritance must be ordered from 'most-base like' to 'most-derived'   C3 Linearization
    
    If you don't follow this order the compile will throw an error

    NB: The order of inheritance determine the layout of storage

    NB: When you deploy D, only single contract is deployed
    The bytecode of inherited contracts are compiled into D

    Therefore, if you call B.foo() from D the EVM will use internal function calls

 */

contract F is A, B {
    function foo() public pure virtual override(A, B) returns (string memory) {
        return "F";
    }
}
