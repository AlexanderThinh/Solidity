//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract GlobalVariable {
    function globalVars() external view returns (address, uint, uint) {
        address sender = msg.sender;
        uint timeStamp = block.timestamp;
        uint blockNumber = block.number;

        return (sender, timeStamp, blockNumber);
    }
}