// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

// any address can send ETH in, but only the owner can withdraw

contract EtherWallet {
    address payable public owner;
    constructor() payable {
        owner = payable(msg.sender);
    }

    receive() external payable{}

    function withdraw(uint _amount) external {
        require(msg.sender == owner," caller is not the owner");
        // replace state variables with variables inside memory
        payable(msg.sender).transfer(_amount);

        // could also use call
        //(bool sent,) = msg.sender.call{value: _amount}("");
        //require(sent, "failed to send ether");
    }

    function getBalance() external view returns (uint) {
        return address(this).balance;
    }
}
