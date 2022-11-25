//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

/*
    3 Way to send ETH
    - transfer: max 2300 gas (~ 4.11 ETH), else revert (whole transaction will fail) (+1)
    - send: max 2300 gas (~ 4.11 ETH), else return bool
    - call: all gas, returns (bool, data) (+2)
*/

contract SendETH {
    constructor() payable {} // Require to deposit ETH to this contract

    event Log(uint amount, address from);

    receive() external payable {
        emit Log(msg.value, msg.sender);
    }

    function sendViaTransfer(address payable _to, uint Wei) external payable {
        _to.transfer(Wei);
    }

    function sendViaSend(address payable _to, uint Wei) external payable {
        bool sent = _to.send(Wei);
        require(sent, "Error: Transaction fail!");
    }

    function sendViaCall(address payable _to, uint Wei) external payable {
        (bool success, ) = _to.call{value: Wei}("");
        require(success, "Error: Transaction fail");
    }

    function getBalance() external view returns (uint) {
        return address(this).balance;
    }
}

contract ReceiverETH {
    event Log(uint amount, address from, uint gas);

    /* 
        Below function will be executed when this transaction receive ETH from another transaction
        And below function is require when another transaction want to send ETH to this transaction
    */
    receive() external payable {
        emit Log(msg.value, msg.sender, gasleft());
    }

    function getBalance() external view returns (uint) {
        return address(this).balance;
    }
}