// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract Event {
    event Log(string message, uint value);
    /*Keyword indexed cho phep user filter 1 event cu the cua giao dich nao do theo dia chi sender, 
        because user co rat nhieu event.
        Truong indexed cho phep user filter event theo dia chi sender
    */ 
    event IndexedLog(address indexed sender, uint val);

    function example() external {
        emit Log("foo", 123);
        emit IndexedLog(msg.sender, 789);
    }

    event Message(address indexed _from, address indexed _to, string message);

    function sendMessage(address _to, string calldata message) external {
        emit Message(msg.sender, _to, message);
    }
}