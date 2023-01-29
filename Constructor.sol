// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Constructor {
    //only called when contract is deployed. used to define state variables
    address public owner;
    uint public x;

    constructor(uint _x) {
        owner = msg.sender;
        x = _x;
    }
}
    
