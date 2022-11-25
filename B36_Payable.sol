//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Payable {
    // Declare this owner can send and receive ETH
    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
    }

    // Declare this function can send ETH
    function deposit123() external payable {

    }

    function getBalance() external view returns (uint) {
        return address(this).balance;
    }
}