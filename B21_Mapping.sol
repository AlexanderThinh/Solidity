//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Mapping {
    address public owner;
    mapping(address => uint) public balances;
    mapping(address => mapping(address => bool)) public isFriend;

    constructor() {
        owner = msg.sender;
        balances[msg.sender] = 777;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Error: Unauthorize");
        _;
    }

    function increaseBalance() external onlyOwner {
        balances[owner] += 10;
    }

    function resetBalance() external onlyOwner {
        delete balances[owner];
    }

    function getBalances() external view returns (uint) {
        return balances[owner]; //reset 0
    }
}