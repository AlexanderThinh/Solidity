// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract EtherWallet {
    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
    }

    // Enable this contract to receive ETH from another transaction
    receive() external payable {}

    //Function allow send ETH to out of transaction
    function withdraw(uint _amount) external {
        require(msg.sender == owner, "Error: Unauthorized");
        // Only owner that create this contract can withdraw ETH
        payable(msg.sender).transfer(_amount);
    }

    function getBalance() external view returns (uint) {
        // Get balance of contract (~ ETH of owner create this contract)
        return address(this).balance;
    }
}