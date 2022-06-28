// SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

/* 
    Solidity supports if,else if and else statements
    However, Solidity doesn't support switch/case statements
    Yul ( Inline Assembly ) allows to use switch/case statements
*/
contract IfElse {
    function foo(uint256 _x) public pure returns (uint256) {
        if (_x < 10) {
            return 0;
        } else if (_x < 20) {
            return 1;
        } else {
            return 2;
        }
    }

    function ternary(uint256 _x) public pure returns (uint256) {
        /*  
        if (_x < 10) {
            return 1;
        } 
        return 2;
      */

        // Shorthand for if / else statements
        return _x < 10 ? 1 : 2;
    }
}
