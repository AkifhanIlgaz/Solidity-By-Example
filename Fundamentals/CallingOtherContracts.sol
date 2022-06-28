// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/* 
    Contract can be called in 2 ways
      
      If you know the source code, ABI

        - You can call contract functions like normal function execution
            A.foo(x,y,z)

      Low-level call with 'call' opcode
*/

contract Callee {
    uint256 public x;
    uint256 public value;

    function setX(uint256 _x) public returns (uint256) {
        x = _x;
        return x;
    }

    function setXandSendEther(uint256 _x)
        public
        payable
        returns (uint256, uint256)
    {
        x = _x;
        return (x, msg.value);
    }
}

contract Caller {
    function setX(Callee _callee, uint256 _x) public {
        uint256 x = _callee.setX(_x);
    }

    function setXWithAddress(address _calleeAddress, uint256 _x) public {
        Callee callee = Callee(_calleeAddress);
        callee.setX(_x);
    }

    function setXandSendEther(address _calleeAddress, uint256 _x)
        public
        payable
    {
        (uint256 x, uint256 value) = Callee(_calleeAddress).setXandSendEther{
            value: msg.value
        }(_x);
    }
}
