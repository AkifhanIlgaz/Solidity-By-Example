// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/* 
    Libraries are similar to contracts, but you can't declare any state variable inside library
    Libraries cannot receive Ether

    A library is embedded into the contract's bytecode if all functions in library is internal

    Otherwise the library must be deployed and the library address will be linked before the contract is deployed

    SafeMath 
    StringUtils
    UniswapLibrary
*/

/* 
    There are two ways to execute a function's library

    1)
        SafeMath.add(x,y)

    2)
        using SafeMath for uint256

        x.add(y)    
*/

library SafeMath {
    function add(uint x, uint y) internal pure returns (uint256) {
        uint z = x + y;
        require(z >= x, "Overflow");
        return z;
    }
}

library Math {
    function sqrt(uint y) internal pure returns (uint z) {
        if (y > 3) {
            z = y;
            uint x = z / 2 + 1;
            while (x < z) {
                z = x;
                x = (y / x + x) / 2;
            }
        } else if (y != 0) {
            z = 1;
        }
    }
}

contract TestLibrary {
    using SafeMath for uint256;

    uint public MAX_UINT = 2**256 - 1;

    function testAdd(uint x, uint y) public pure returns (uint) {
        return x.add(y);
    }

    function testSquareRoot(uint x) public pure returns (uint) {
        return Math.sqrt(x);
    }
}

// Array function to delete an element at specified index and re-organize array
// so that there are no gaps betweens elements
// delete arr[index] resets the value of element not deletes element

library Array {
    function remove(uint[] storage arr, uint index) internal {
        require(arr.length > 0, "Can't remove from empty array");
        arr[index] = arr[arr.length - 1];
        arr.pop();
    }
}

contract TestArray {
    using Array for uint[];

    uint[] public arr;

    function testArryRemove(uint index) public {
        // Initialize array for testing
        for (uint i = 0; i < 3; i++) {
            arr.push(i);
        }

        // arr is the first parameter of the remove function
        arr.remove(index);

        // Tests
        assert(arr.length == 2);
        assert(arr[0] == 0);
        assert(arr[1] == 2);
    }
}
