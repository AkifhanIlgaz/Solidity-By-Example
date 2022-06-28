// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/* 

    Fallback is a function that does not take any arguments and does not return anything

    It is executed when:

     - A function that doesn't exist is called
     - Ether is sent directly to the contract but receive() doesn't exist and msg.data is not empty


    Fallback function can spend max 2300 gas when called by 'send' or 'transfer' 

*/

contract Fallback {
    event Log(uint gas);

    // Fallback function must be declared as external
    fallback() external payable {
        // send / transfer ( forwards 2300 gas to the fallback function )
        // call ( forwards all gas )

        // gasleft() returns remaining gas
        emit Log(gasleft());
    }

    // Helper function to check contract balance
    function getBalance() public view returns(uint) {
        return address(this).balance;
    }
}


contract SendToFallback {
    function transferToFallback(address _to) public payable {
        payable(_to).transfer(msg.value);
    }

    function callFallback(address _to) public payable {
        (bool sent,) = payable(_to).call{value: msg.value}("");
        require(sent);
    }
}
