// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract Payable {
    // use the payable keyword if want to recievee ether
    // also can make address payable
    address payable public  owner;

    constructor() {
        // need to cast as payable becuase state variable is payable
        owner = payable(msg.sender)
    }
    function deposit() external payable {}

    funciton getBalance() external view returns (uint) {
        return address(this).balance;
    }
}
