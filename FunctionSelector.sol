// SPDX-License-Identifier: MIT

pragma solidity 0.8.17;

contract Receiver {
    event Log(bytes data);

    function transfer(address _to, uint _amount) external {
        emit Log(msg.data);
        // 0xa9059cbb - function selector. found by hashing function and params and then gets first 4 bytes
        //  params - 0000000000000000000000005b38da6a701c568545dcfcb03fcb875f56beddc4
        // 000000000000000000000000000000000000000000000000000000000000000b
    }
}
