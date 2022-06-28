// SPDX-License-Identifier: MIT


pragma solidity ^0.8.0;


/* 
    You can interact with other contracts by declaring an Interface

    - Cannot have any functions implemented
    - Can inherit from other interfaces
    - All declared functions must be external
    - Cannot declare a constructor
    - Cannot declare state variables

*/

contract Counter {

    uint public count;

    function increment() external {
        count++;
    }
}

// Interface names starts with 'I' by convention

interface ICounter {
    function count() external view returns(uint);

    function increment() external;
}


/*
    If a contract inherits an interface
        The contract must implement all functions of interface
*/ 

contract MyContract {

    function incrementCounter(address _counter) external {
        // ICounter(address) means that
        // We believe that (_counter) contract has implemented all the functions we declared in ICounter interface
        // Therefore, we can call functions of _counter like calling a method from an object
        ICounter(_counter).count();
    }

    function getCount(address _counter) external view returns(uint) {
        return ICounter(_counter).count();
    }
}


// Uniswap Example
interface UniswapV2Factory {
    function getPair(address tokenA, address tokenB)
        external
        view
        returns (address pair);
}

interface UniswapV2Pair {
    function getReserves()
        external
        view
        returns (
            uint112 reserve0,
            uint112 reserve1,
            uint32 blockTimestampLast
        );
}

contract UniswapExample {
    address private factory = 0x5C69bEe701ef814a2B6a3EDD4B1652CB9cc5aA6f;
    address private dai = 0x6B175474E89094C44Da98b954EedeAC495271d0F;
    address private weth = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2;

    function getTokenReserves() external view returns(uint,uint) {
        address pairAddress = UniswapV2Factory(factory).getPair(dai, weth);
        (uint reserve0, uint reserve1,) = UniswapV2Pair(pairAddress).getReserves();
        return (reserve0, reserve1);
    }
}


