// SPDX-License-Identifier: MIT

pragma solidity ^0.8.10;

contract Arrays {
    uint256[] public arr;
    uint256[] public arr2 = [1, 2, 3];

    // All values are initialized to 0.
    uint256[10] public fixedSizeArray;

    // Solidity can return entire array.
    // But if you don't know what you are doing please avoid using this function.
    // Especially for arrays that can grow limitlessly in size => Dynamic Arrays.
    function getArray() public view returns (uint256[] memory) {
        return arr;
    }

    function push(uint256 _i) public {
        // Append to array
        // This will increase the array length by 1
        arr.push(_i);
    }

    function pop() public {
        // Remove the last element of an array
        // This will be decrease the array length by 1.
        arr.pop();
    }

    function getLength() public view returns (uint256) {
        return arr.length;
    }

    function remove(uint256 index) public {
        // Delete does not change the length of the array.
        // It sets the value of index to default value
        // In our example , it set to 0.
        delete arr[index];
    }

    function examples() external {
        uint256[] memory a = new uint256[](5);
    }
}
