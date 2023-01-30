// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// Arrarys can be dynamic or fixed size

contract Array {
    uint[] public nums = [1, 2, 3];
    uint[3] public fixedNums;

    function examples() external {
        nums.push(5);
        uint element = nums[1];
        nums[2] = 77;
        delete nums[1]; // will then de default uint value of 0 and the length stays the same
        nums.pop();

        // create array in memory and has to be fixed size, so no push or pop
        uint[] memory a = new uint[](5);
    }
        // the memory means copy state variable nums into memory and then return.
        // not recomemded due to potential gas cost of large arrays
    function returnArray() external view returns (uint[] memory) {
        return nums;
    }



}
