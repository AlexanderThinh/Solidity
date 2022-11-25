//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

/*
    fallback execute when
    - function doesn't exist
    - directly send ETH
    - "receive" is similar to "fallback"

    fallback or receive?

                Ether is sent to contract
                            |
                    is msg.data empty?
                         /     \
                       yes     no
                       /         \
            receive() exist?    fallback()
                /     \
              yes     no
              /         \
        receive()      fallback()
*/

contract Fallback {
    /* 
        TH1: when another another contract try to send directly ETH to this contract,
            (~ this contract receive ETH from another contract)
            below function will be executed
        TH2: An account send directly ETH to another contract (only when hit btn "Transact", maybe have data),
            below function will be executed
    */

    event Log(string func, address sender, uint value, bytes data);

    fallback() external payable {
        emit Log("fallback", msg.sender, msg.value, msg.data);
    }

    receive() external payable {
        emit Log("receive", msg.sender, msg.value, "");
    }
}