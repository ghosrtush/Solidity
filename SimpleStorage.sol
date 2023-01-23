// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9; // Set the solidity version at least 0.8.9

// contract is similar to a class
contract SimpleStorage { 
    //boolean, uint, int, address, bytes
    // bool hasFavouriteNumber = true;
   // string favouriteNumberInText = "Five";
    // int256 favouriteInt = -123;
    // address myAddress = 0x1115255555555;
    // bytes32 favouriteBytes = "cat";

    // This gets initialized to zero
    // By making it public can view the variable
    // Can be public,private, external, internal
    uint256 public favouriteNumber;

    function store(uint256 _favouriteNumber) public {
        favouriteNumber = _favouriteNumber;
    }

    function retrieve() public view returns(uint256) {
        return favouriteNumber;
    }



} 
