// SPDX-License-Identifier: MIT

pragma solidity ^0.8.10;

contract RemoveByShifting {
    // [1, 2, 3] -- remove(1) --> [1, 3, 3] --> [1, 3]
    // [1, 2, 3, 4, 5, 6] -- remove(2) --> [1, 2, 4, 5, 6, 6] --> [1, 2, 4, 5, 6]
    // [1, 2, 3, 4, 5, 6] -- remove(0) --> [2, 3, 4, 5, 6, 6] --> [2, 3, 4, 5, 6]
    // [1] -- remove(0) --> [1] --> []

    uint256[] public arr;

    function remove(uint256 _index) public {
        require(_index < arr.length, "Index out of bond.");

        for (uint256 i = _index; i < arr.length; i++) {
            arr[i] = arr[i + 1];
        }

        arr.pop();
    }
}

contract ArrayReplaceFromEnd {
    uint256[] public arr;

    // Deleting an element from an array creates a gap.
    // [1,2,3,4] => delete arr[1] => [1,0,3,4]
    // Move the last element into the place to delete
    function remove(uint256 _index) public {
        arr[_index] = arr[arr.length - 1];
        arr.pop();
    }

    // array = [1,2,3,4]
    // remove(1)
    // array = [1,4,3]
}
