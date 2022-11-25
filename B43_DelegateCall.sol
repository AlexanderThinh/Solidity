//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract TestDelegateCall {
    uint public num; // NOT Change value when setVars() (line 21) function execute becase we use "delegatecall"
    address public sender; // NOT Change value when setVars() (line 21) function execute becase we use "delegatecall"
    uint public value; // NOT Change value when setVars() (line 21) function execute becase we use "delegatecall"

    function setVars(uint _num) external payable {
        num = _num * 2;
        sender = msg.sender;
        value = msg.value;
    }
}

contract DelegateCall {
    uint public num; // Change value when setVars() (line 21) function execute becase we use "delegatecall"
    address public sender; // Change value when setVars() (line 21) function execute becase we use "delegatecall"
    uint public value; // Change value when setVars() (line 21) function execute becase we use "delegatecall"

    function setVars(address _test, uint _num) external payable {
        // _test.delegatecall(
        //     abi.encodeWithSignature("setVars(uint256)", _num)
        // );

        (bool success, bytes memory data) =  _test.delegatecall(
            abi.encodeWithSelector(TestDelegateCall.setVars.selector, _num)
        );
        require(success, "Error: delegatecall failed");
    }
}