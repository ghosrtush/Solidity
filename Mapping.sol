// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Mapping {
    // Mapping is similiar to a dictionary
    // key type => value type
    mapping(address => uint) public balances;
    mapping(address => mapping(address => bool)) public isFriend;

    function examples() external {
        balances[msg.sender] = 123;
        uint bal = balances[msg.sender];
        uint bal2  =balances[address(1)]; // retunrs 0
        // upate balance
        balances[msg.sender] += 456; // 123 + 456

        delete balances[msg.sender];

        isFriend[msg.sender][address(this)] = true;

    }
}
