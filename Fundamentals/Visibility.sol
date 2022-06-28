// SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

/*
    Function and state variables have to declare whether they are accessible by other contracts

    Functions

        Public => Any contract or any account can call
        Private => Only this contract can call
        Internal => This contract and the contracts that inherits our contract can call
        External => Only other contracts and accounts can call

    State Variables 

        Can be declared as public,private,internal
        Cannot be declared as external

 */

contract Base {
    // privateFunction() only be called inside this contract
    // Contract that inherits this contract cannot call this function

    function privateFunction() private pure returns (string memory) {
        return "Private function called";
    }

    // If you embed a private function into a public/external function you can call private functions indirectly

    function testPrivateFunction() public pure returns (string memory) {
        return privateFunction();
    }

    /* internalFunction() can be called:
         - Inside this contract
         - Inside contract that inherits this contract
    */

    function internalFunction() internal pure returns (string memory) {
        return "Internal function called";
    }

    function testInternalFunction() public pure returns (string memory) {
        return internalFunction();
    }

    /* 
        publicFunction() can be called:

            - Inside this contract
            - Inside contract that inherits this contract
            - By other contracts and accounts
            
    */

    function publicFunction() public pure returns (string memory) {
        return "Public function called";
    }

    /* 
        externalFunction() can be called

            - Only by other contracts and accounts 
    */

    function externalFunction() external pure returns (string memory) {
        return "External function called.";
    }

    // This function will not compile since we're trying to call
    // an external function here.
    // function testExternalFunc() public pure returns (string memory) {
    //     return externalFunc();
    // }

    // State Variables

    string private privateVar = "my private variable";
    string internal internalVar = "my internal variable";
    string public publicVar = "my public variable";
    // State variables cannot be external so this code won't compile.
    // string external externalVar = "my external variable";
}

contract Child is Base {
    // Inherited contracts do not have access to private functions
    // and state variables.
    // function testPrivateFunc() public pure returns (string memory) {
    //     return privateFunc();
    // }

    // Internal function call be called inside child contracts.
    function testInternalFunction()
        public
        pure
        override
        returns (string memory)
    {
        return internalFunction();
    }
}
