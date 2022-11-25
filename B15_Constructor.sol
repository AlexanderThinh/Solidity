//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Constructor {
    address public owner;
    uint public x;

    //The constructor called only one time when contract deployed
    constructor (uint _x) {
        owner = msg.sender;
        x = _x;
    }
}