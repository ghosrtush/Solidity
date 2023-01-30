// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;
contract ArrayReplaceLast {

 uint[] public arr;
// only two action so more gass efficient, but then the order is not reserved
function remove(uint _index) public {
   

    arr[_index] = arr[arr.length -1];
    arr.pop();
}
}
