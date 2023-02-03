// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract Immutable {
    // can create state variale that is treated like a constant except set only once.
    // immutable variables use less gas then state variables
    address public immutable owner = msg.sender;


}
