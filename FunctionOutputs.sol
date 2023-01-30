// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

// return multiple outputs
contract FunctionOutputs {
    function returnMany() public pure returns (uint, bool) {
        return (1, true);
    }
// Named outputs
    function named() public pure returns (uint x, bool b) {
        return (1, true);
    }
// When using the named output you can omit the return  and save gas
    function assigned() public pure returns (uint x, bool b) {
        x = 1;
        b = true;
    }
    // Destructuring Assignment
    function destructuringAssignments() public pure {
        (uint x, bool b) = returnMany();
        // only capture second output
        (, bool b) = returnMany();
    }

}
