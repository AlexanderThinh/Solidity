//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract FunctionOutputs {
    //There are many way to return many values in a function
    function returnMany() public pure returns(uint, bool) {
        return (2, true);
    }

    function returnMany2() public pure returns(uint x, bool b) {
        return (1, true);
    }

    function returnMany3() public pure returns(uint x, bool b) {
        x = 1;
        b = true;
    }

    //
    function destructingAssignments() public pure returns (uint, bool) {
        (uint x, bool b) = returnMany();
        
        x += 1;
        b = false;

        return (x, b);
    }
}