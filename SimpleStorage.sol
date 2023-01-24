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

    mapping(string => uint256) public nameToFavouriteNumbber;

    People public person = People({favouriteNumber:2, name: 
    "Nick"});


    // struct is similar to an object
    struct People {
        uint256 favouriteNumber;
        string name;
    }
    // uint256[] public favouriteNumbersList;
    People[] public people;

    function store(uint256 _favouriteNumber) public {
        favouriteNumber = _favouriteNumber;
    }

    function retrieve() public view returns(uint256) {
        return favouriteNumber;
    }

    // variable stored in memory only exist temporarily during the transaction, can't be accessed outside the fucntion
    function addPerson(string memory _name, uint256 _favouriteNumber) public {
        people.push(People(_favouriteNumber, _name));
        nameToFavouriteNumbber[_name] = _favouriteNumber;
    }



} 
