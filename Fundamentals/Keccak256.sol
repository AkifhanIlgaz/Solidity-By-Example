// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/* 
    keccak256 computes the Keccak256 hash of the given input

    Some use cases:
     - Creating a deterministic unique ID from a input
     - Commit-Reveal scheme
     - Compact cryptographic signature (by signing the hash instead of a larger input) 
*/

contract HashFunction {
    // abi.encodePacked() concatenates given inputs
    // abi.encode() encodes given inputs according to ABI specification
    function hash(
        string memory _text,
        uint _num,
        address _addr
    ) public pure returns (bytes32) {
        return keccak256(abi.encodePacked(_text, _num, _addr));
    }

    // Example of hash collision
    // Hash collision can occur when you pass more than one dynamic data type
    // to abi.encodePacked. In such case, you should use abi.encode instead.

    function collision(string memory _text, string memory _anotherText)
        public
        pure
        returns (bytes32)
    {
        // abi.encodePacked(AAA , BBB) => AAABBB
        // abi.encodePacked(AA , ABBB) => AAABBB
        return keccak256(abi.encodePacked(_text, _anotherText));
    }
}

contract GuessTheMagicWord {
    bytes32 public answer =
        0x60298f78cc0b47170ba79c10aa3851d7648bd96f2f8e46a19dbc777c36fb0c00;

    // Magic word is "Solidity"
    function guess(string memory _word) external view returns (bool) {
        return keccak256(abi.encodePacked(_word)) == answer;
    }
}
