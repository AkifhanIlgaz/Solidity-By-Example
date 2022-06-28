// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/* 
    Contracts can be created by other contracts by using 'new' keyword.

    Since 0.8.0 'new' keyword supports 'create2' feature by specifying salt option

*/

contract Car {
    address public owner;
    string public model;
    address public carAddress;

    constructor(address _owner, string memory _model) payable {
        owner = _owner;
        model = _model;
        carAddress = address(this);
    }
}

contract CarFactory {
    Car[] public cars;

    function create(address _owner, string memory _model) public {
        Car car = new Car(_owner, _model);
        cars.push(car);
    }

    function createandSendEther(address _owner, string memory _model)
        public
        payable
    {
        Car newCar = new Car{value: msg.value}(_owner, _model);
        cars.push(newCar);
    }

    function create2(
        address _owner,
        string memory _model,
        bytes32 _salt
    ) public {
        Car newCar = new Car{salt: _salt}(_owner, _model);
        cars.push(newCar);
    }

    /*
    You can use CREATE2 opcode in assembly to create other contracts in a contract

    Uniswap Factory contract uses CREATE2 opcode to create new pair contracts

*/

    function createCar(
        address _owner,
        string memory _model,
        bytes32 _salt
    ) public {
        bytes memory bytecode = abi.encodePacked(
            type(Car).creationCode,
            abi.encode(_owner, _model)
        );
        address newCarAddress;
        assembly {
            // 'bytecode' is a pointer
            // It points out the length of "bytecode" byte array
            // Length is 32 byte word. After length we store actual bytecode in memory
            // Therefore, we use (bytecode + 32) as offset
            newCarAddress := create2(
                0, // value
                add(bytecode, 32), // offset
                mload(bytecode), // size
                _salt
            )
        }
    }

    function createCarandSendEther(
        address _owner,
        string memory _model,
        bytes32 _salt
    ) public payable {
        // Constructor arguments are appended to the bytecode as ABI encoded
        bytes memory bytecode = abi.encodePacked(
            type(Car).creationCode,
            abi.encode(_owner, _model)
        );
        address newCarAddress;
        assembly {
            // 'bytecode' is a pointer
            // It points out the length of "bytecode" byte array
            // Length is 32 byte word. After length we store actual bytecode in memory
            // Therefore, we use (bytecode + 32) as offset
            newCarAddress := create2(
                callvalue(), // value
                add(bytecode, 32), // offset
                mload(bytecode), // size
                _salt
            )
        }
    }

    function create2andSendEther(
        address _owner,
        string memory _model,
        bytes32 _salt
    ) public payable {
        Car newCar = new Car{value: msg.value, salt: _salt}(_owner, _model);
        cars.push(newCar);
    }

    function getCar(uint256 _index)
        public
        view
        returns (
            address owner,
            string memory model,
            address carAddress,
            uint256 balance
        )
    {
        Car car = cars[_index];

        return (
            car.owner(),
            car.model(),
            car.carAddress(),
            address(car).balance
        );
    }
}
