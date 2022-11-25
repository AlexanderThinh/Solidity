// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract SimpleStorage {
    string public text;

    // Tham so type string co the khai bao dang "calldata" hoac "memory"
    function set(string calldata _text) external {
        text = _text;
    }

    function get() external view returns(string memory) {
        return text;
    }
}