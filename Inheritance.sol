// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;
// B will inherit from A. Declare the inherited functions as virtual. When means it can be inherited and the customised by the child contract.

contract A {
    function foo() public pure virtual returns (string memory) {
        return "A";
    }

    function bar() public pure virtual returns (string memory) {
        return "A";
    }
}

contract B is A {
    function foo() public pure override returns (string memory) {
        return "B";
    }

    function bar() public pure override returns (string memory) {
        return "B";
    }
}
