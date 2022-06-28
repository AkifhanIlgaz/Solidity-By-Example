// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/*
    call is a low-level function to interact with other contracts

    This is recommended when you're just sending Ether via calling fallback function 

    You can use 'call' to interact with contracts that you don't know interface or ABI of contract

    But this is not recommended.

*/ 


contract Receiver {
    event Received(address caller, uint amount, string message);

    fallback() external payable {
        emit Received(msg.sender, msg.value, "Fallback was called");
    }

    function foo(string memory _message, uint _x) public payable returns(uint){
        emit Received(msg.sender, msg.value, _message);

        return _x + 1 ;
    } 
}


contract Caller {

    event Response(bool success, bytes data);

    // We don't know the source code or ABI of Receiver contract
    // But we know the address of Receiver contract and the function to call
    function testCallFoo(address payable _addr) public payable {

        (bool success, bytes memory data) = _addr.call{value: msg.value, gas: 5000}(abi.encodeWithSignature("foo(string,uint256)", "call Foo", 123));

        // You can use abi.encodeWithSelector or abi.encodeWithSignature to generate calldata for the function call

        // abi.encodeWithSelector(bytes4(keccak256(abi.encodePacked("foo(string,uint256)"))), "call Foo", 123);

        emit Response(success, data);
    }

    // Calling a function that does not exist triggers the fallback function
    function testCallDoesNotExist(address _addr) public {
        (bool success, bytes memory data) = _addr.call(abi.encodeWithSignature("doesNotExist()"));

        emit Response(success, data);
    }
}