// SPDX-License-Identifier: MIT

pragma solidity ^0.8.10;

contract Mapping {
    mapping(address => uint256) public myMap;

    function get(address _address) public view returns (uint256) {
        // Mappings always return value
        // If it is not initialized return default value
        return myMap[_address];
    }

    function set(address _address, uint256 _i) public {
        myMap[_address] = _i;
    }

    function remove(address _address) public {
        // Reset the value to default.
        delete myMap[_address];
    }

    mapping(address => mapping(uint256 => bool)) public nestedMapping;

    function getNested(address _address, uint256 _i)
        public
        view
        returns (bool)
    {
        return nestedMapping[_address][_i];
    }

    function setNested(
        address _address,
        uint256 _i,
        bool _boo
    ) public {
        nestedMapping[_address][_i] = _boo;
    }

    function removeNested(address _address, uint256 _i) public {
        delete nestedMapping[_address][_i];
    }
}
