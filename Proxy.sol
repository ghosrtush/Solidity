// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Proxy {
    // emit event when contract is deployed
    event Deploy(address);
    // payable keyword alows to send enther once contract is deployed
    function deploy(bytes memory _code) external payable returns (address addr) {
        assembly {
            // create (v, p, n)
            // v = amount of eth to send
            // p = pointer in memory
            // n = size of code


            // start after 32 bytes. first 32 bytes stores the length
            // short cut: if type is defined in the return, then don't have to define in function or return it
           addr := create(callvalue(), add(_code, 0x20), mload(_code))}
        require(addr != address(0), "deploy failed");
        emit Deploy(addr);

    }
}
