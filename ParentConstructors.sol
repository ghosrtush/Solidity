// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

// 2 ways to call parent constructors
//order of initialization

contract S {
    string public name;

    constructor(string memory _name) {
        name = _name;
    }
}

contract T {
    string public text;

    constructor(string memory _text) {
        text = _text;
    }
}

// if you know the parametes of the constructor, pass in the contract
contract U is S("Test"),T("TestNew") {

}

contract V is S, T {
    //pass dynamic inputs to constructor
    constructor(string memory _name, string memory _text) S(_name) T(_text) {

    }
}

