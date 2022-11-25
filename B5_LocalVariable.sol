//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract LocalVariable {
    uint public i;
    bool public b;
    address public myAddress;

    function changeValue() external {
        i += 1;
        myAddress = msg.sender;
    }

    function foo() external returns (uint) {
        uint x = 253;
        bool f = false;

        x += 1;
        f = true;

        i = 123;
        b = true;
        myAddress = msg.sender;
        
        return i;
    }
}