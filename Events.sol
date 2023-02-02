// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Event {
    event Log(string message, uint value);
    // search for event by parameter. up to 3 params can be indexed
    event IndexedLog(address indexed, sender, uint val);


    // this is a transactional function as the parameters are logged to blockchain
    function example() external {
        emit Log("Test Message", 3);
        emit IndexedLog(msg.sender, 555);
    }

    event Message(address indexed _from, address indexed _to, string message);

    function sendMessage(address _to, string calldata message) external {
        emit Message(msg.sender, _to, _message);
    }
}
