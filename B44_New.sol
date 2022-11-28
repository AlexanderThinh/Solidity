//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Account {
    address public bank;
    address public owner;
    uint256 public val;

    constructor(address _owner) payable {
        bank = msg.sender;
        owner = _owner;
        val = msg.value;
    }

    function getBalance() external view returns (uint256) {
        return address(this).balance;
    }
}

contract AccountFactory {
    Account[] public accounts;

    constructor() payable {} // Require to deposit ETH to this contract

    function createAccount(address _owner) external payable {
        // Send ETH (100 wei) to contract Account throught keyword new
        Account account = new Account{value: 100}(_owner);
        accounts.push(account);
    }

    function getBalance() external view returns (uint256) {
        return address(this).balance;
    }
}
