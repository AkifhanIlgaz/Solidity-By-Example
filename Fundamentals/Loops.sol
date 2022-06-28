// SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

contract Loops {
    function loop() public {
        // for loop
        for (uint256 i = 0; i < 10; i++) {
            if (i == 3) {
                // Skip to the next iteration with continue
                continue;
            } else if (i == 5) {
                // Exit loop with break
                break;
            }
        }

        // while loop
        uint256 j;
        while (j < 10) {
            j++;
        }
    }
}
