//SPDX-Licence-Identifier: MIT
pragma solidity ^0.8.7;

// require, revert, assert
// gas refunded, state updates are reverted. or use custom error to save gas

contract Error {
    // require is used for access control and to validate inputs
    function testRequire(uint _i) public pure {
        require(_i <= 10, "i > 10");
        // code

    }
    function testRevert(uint _i) public pure {
        if (_i > 10) {
            revert("i > 10");
        }
    }
    uint public num  = 123;
    function testAssert() public view {
        assert(num == 123);
    }

    error MyError(address  caller, uint i);

    function testCustomError(uint _i) public view {
        if (_i >10) {
            revert MyError(msg.sender, _i);
        }

    }
}
