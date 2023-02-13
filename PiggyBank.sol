// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

contract PiggyBank {
    event Deposit(uint ammount);
    event Withdraw(uint ammount);
    address public owner = msg.sender;
    //anyone can deposit but only the owner can withdraw

    receive() external payable {
        emit Deposit(msg.value);
    }

    function withdraw() external {
        require(msg.sender == owner, "Not the owner");
        emit Withdraw(address(this).balance);
        selfdestruct(payable(msg.sender));
    }
}
