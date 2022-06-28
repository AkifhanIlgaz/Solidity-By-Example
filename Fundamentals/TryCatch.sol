// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/* 
    try/catch can only catch errors from external functions and contract creations
*/

contract Foo {
    address public owner;

    constructor(address _owner) {
        require(_owner != address(0), "Invalid address");
        assert(_owner != 0x0000000000000000000000000000000000000001);
        owner = _owner;
    }

    function myFunc(uint _x) public pure returns (string memory) {
        require(_x != 0, "Require failed");
        return "My function is called";
    }
}

contract Bar {
    event Log(string message);
    event LogBytes(bytes data);

    Foo public foo;

    constructor() {
        foo = new Foo(msg.sender);
    }

    function tryCatchExternalCall(uint _x) public {
        try foo.myFunc(_x) returns (string memory result) {
            emit Log(result);
        } catch {
            emit Log("External call failed");
        }
    }

    function tryCatchNewContract(address _owner) public {
        try new Foo(_owner) returns (Foo foo) {
            emit Log("Foo created");
        } catch Error(string memory reason) {
            emit Log(reason);
        } catch (bytes memory reason) {
            emit LogBytes(reason);
        }
    }
}
