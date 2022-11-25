// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

/*
    when a contract (contract A) call another contract (contract B)
    if contract A call a function that change state of variable (x) in contract B
    The variable x in contract B will also change state
    And this variables in contract A (same name of variables in contract B) NOT change
*/

contract TestContract {
    uint public x;
    uint public val = 123;

    function setX(uint _x) external {
        x = _x;
    }

    function getX() external view returns (uint) {
        return x;
    }

    function setXAndReceiveEther(uint _x) external payable {
        x = _x;
        val = msg.value;
    }

    function getXAndValue() external view returns (uint, uint) {
        return (x, val);
    }
}

contract CallTestContract {
    uint public x;
    uint public val = 123;

    function callSetX(TestContract _test, uint _x) external {
        _test.setX(_x); // Both change state of value x in this contract and TestContract
    }

    function callGetX(address _test) external view returns (uint) {
        return TestContract(_test).getX();
    }

    function callSetXAndSendEther(address _test, uint _x) external payable {
        TestContract(_test).setXAndReceiveEther{value: msg.value}(_x);
    }

    function callGetXAndValue(address _test) external view returns (uint, uint) {
        (uint x, uint value) = TestContract(_test).getXAndValue();

        return (x, value);
    }
}