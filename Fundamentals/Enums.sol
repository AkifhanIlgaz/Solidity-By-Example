// SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

contract Enums {
    // An enum that represents shipping status
    enum Status {
        Pending,
        Shipped,
        Accepted,
        Rejected,
        Canceled
    }

    // Default value is first element of enum
    Status public status; // Pending

    // Returns uint
    // Pending  - 0
    // Shipped  - 1
    // Accepted - 2
    // Rejected - 3
    // Canceled - 4
    function get() public view returns (Status) {
        return status;
    }

    // Update status by passing uint into input
    function set(Status _status) public {
        status = _status;
    }

    // You can update to a specific enum like this
    function cancel() public {
        status = Status.Canceled;
    }

    // Delete resets the enum to its first value, 0
    function reset() public {
        delete status;
    }
}
