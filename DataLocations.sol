// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// calldata type can save gas 
// memory type can read and modify without saving to blockchain

contract DataLocations {
    struct MyStruct {
        uint foo;
        string text;
    }
    mapping(address => MyStruct) public myStructs;
    
    function examples(uint[] memory y, string memory s) external   {
        myStructs[msg.sender] = MyStruct({foo: 123, text: "bar"});

        // set as storage if you want to change value
        MyStruct storage myStruct = myStructs[msg.sender];
        myStruct.text = "foo";

        // if modified, the change will not be saved. only exists in the function
        MyStruct memory readOnly = myStructs[msg.sender];

        // can only be fixed size for arr initialized in memory
        uint[] memory memoryArray = new uint[] (3);
        memoryArray[0] = 33;
        

        



    }

}
