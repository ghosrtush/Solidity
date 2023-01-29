// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Ownable {
    address public owner;

    constructor() {
        owner = msg.sender;
    }
    // function modifier that only allows the owner to call
    modifier onlyOnwer() {
        require(msg.sender == owner," Not the owner");
        _;
    }

    function setOwner(address _newOwner) external onlyOnwer {
        require(_newOwner != address(0),"Invalid address");
        owner = _newOwner;
    }
}
