// SPDX-License-Identifier: MIT

pragma solidity ^0.8.10;

// Some of the primitive data types in Solidity:
// Boolean
// Int
// Uint
// Address
// bytes

contract Primitives {
    // Booleans
    // true / false
    bool public boo = true;

    // Uint => Unsigned Integer, meaning non-negative integers.
    // Different size of Uint
    // uint8 => It can store 8 bit values. [0, 2**8 -1]
    // uint16 => [0, 2**16 -1]
    // ...
    // uint256 => [0, 2**256 -1]
    // If we don't specify the max bit value of an integer, default uint256
    // uint => uint256

    uint256 public u8 = 1;
    uint16 public u16 = 36;
    uint256 public u = 1546;

    // Int => Signed Integer, Negative numbers are allowed.
    // int128 => [-2**127 , 2**127 -1]
    // int => int256

    int256 public i8 = -1;
    int16 public i16 = -36;
    int256 public i = -6848;

    // Max and min value for int
    int256 public minInt = type(int256).min;
    int256 public maxInt = type(int256).max;

    // Addresses are just Ethereum addresses.
    address public addr = 0xCA35b7d915458EF540aDe6068dFe2F44E8fa733c;

    // Bytes in Solidity
    // The data type byte represent a sequence of bytes.
    // Two types of bytes:
    // Fixed-Sized Byte Arrays
    // Dynamically-Sized Byte Arrays

    // The term bytes in Soliditiy represents a dynamic array of bytes
    // It's a shorthand for bytes[]

    bytes1 a = 0xb5; // [10110101]
    bytes1 b = 0x56; // [01010110]

    // Default Values
    bool public defaultBoo; // false
    uint256 public defaultUint; // 0
    int256 public defaultInt; // 0
    address public defaultAddress; // Zero Address 0x0000000000000 => 20 byte
}
