// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

// there are 3 wats to send ETH
// transfer - 2300 gas, reverts if send fails
// send 2300 gas, returns bool
// call all gas, returns bool and data. this is the recomended way.

contract SendEther {
    constructor() payable {}

    receive() external payable{}

    function sendViaTransfer(address payable _to) payable external {
        //transfer is avaliable to a payable address
        _to.transfer(123);

    }

    function sendViaSend(address payable _to ) payable external  {
        bool sent = _to.send(123);
        require(sent, "send failed");
    }


    function sendViaCall(address payable _to) payable external  {
        (bool success, bytes memory data) = _to.call{value: 123}("");
        require(success, "call failed");
    }


}

contract EthReceiver {
    event Log(uint amount, uint gas);

    receive() payable external  {
        emit Log(msg.value, gasleft());
    }
}

