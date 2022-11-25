//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract StateVariable {
    //There are 3 types of variables in solidity: local, state, global
    
    //Declare state variable
    uint public myUint = 777;

    function foo() external pure returns (uint) {
        //Declare local variable (Variables were declared in function)
        uint notStateVariable = 253;

        return notStateVariable;
    }
}