// SPDX-License-Identifier: MIT 

pragma solidity ^0.8.7;

contract TestCall {
    string public message;
    uint public x;

    event Log(string message);

    fallback() external payable {
        emit Log("fallback was called");
    }

    function foo(string memory _message, uint _x) external payable returns(bool, uint) {
        message = _message;
        x = _x;
        return (true, 999);
    }
}

contract Call {
    bytes public returnData;

    function callFoo(address _test) external payable {
        // call returns a bool and then any return from the function called
       (bool success, bytes memory data) =  _test.call{value: 111}(abi.encodeWithSignature("foo(string,uint256", "call foo", 123));
       require(success, "call failed");
       returnData = data;
    }

    function callDoesNotExist(address _test) external {
       (bool success,) =  _test.call(abi.encodeWithSignature("doesnotexist()"));
       require(success, "call failed");
    }
}
