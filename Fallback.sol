// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

// Fallback fucntions are executed when either the function does not exist. It enables  ETH is directly sent
// fallback is mostly used for the smart contract to recieve ether. Also has to be made payable.
contract Fallback {
    event Log(string func, address sender, uint value, bytes data);

    fallback() external payable {
         // executed if msg.data is not empty
    emit Log("fallback", msg.sender, msg.value, msg.data);
    }
   

    receive() external payable{
        // executed when the msg.data is empty and receive() is declared
        emit Log("receive", msg.sender, msg.value, "");
    }
    
}
