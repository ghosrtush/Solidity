// SPDX-License-Identifier: MIT 

pragma solidity ^0.8.7;

import "./SimpleStorage.sol";

contract ExtraStorage is SimpleStorage{
    // override the function you want to change
    // using override and virtual

    function store(uint256 _favouriteNumber) public override {
        favoriteNumber = _favouriteNumber + 5;
    }

}
