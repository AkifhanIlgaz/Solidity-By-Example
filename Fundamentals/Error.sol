// SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

/* 
    An error will undo all changes made to the state during the transaction

    require => Validate inputs and conditions before execution
    revert => Similar to require
    assert => Check for code that should never be false

*/

contract Error {
    function testRequire(uint256 _i) public pure {
        // Require should be used to validate conditions such as:
        // - inputs
        // - conditions before execution
        // - return values from calls to other functions
        require(_i < 10, "The input must be less than 10");
    }

    function testRevert(uint256 _i) public pure {
        // Revert is useful when the condition to check is complex.
        // This code does the exact same thing as the example above
        if (_i >= 10) {
            revert("The input must be less than 10");
        }
    }

    uint256 public num;

    function testAssert() public view {
        // Assert should only be used to test for internal errors,
        // and to check invariants.
        // Here we assert that num is always equal to 0
        // since it is impossible to update the value of num

        assert(num == 0);
    }

    // Use custom errors to save gas
    error NotOwner(address owner, address msgSender);

    function testCustomError() public view {
        address owner = address(this); // The address of contract's owner
        if (msg.sender != owner) {
            revert NotOwner(owner, msg.sender);
        }
    }
}

contract Account {
    uint256 balance;
    uint256 public constant MAX_VALUE = type(uint256).max;

    function deposit(uint256 _amount) external {
        uint256 oldBalance = balance;
        uint256 newBalance = oldBalance + _amount;

        require(newBalance > oldBalance, "Overflow");

        balance = newBalance;

        assert(balance >= oldBalance);
    }

    function withdraw(uint256 _amount) external {
        uint256 oldBalance = balance;

        require(balance >= _amount, "Underflow");

        if (balance < _amount) {
            revert("Underflow");
        }

        balance -= _amount;

        assert(balance <= oldBalance);
    }
}
