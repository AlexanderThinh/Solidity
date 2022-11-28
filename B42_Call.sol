//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract TestCall {
    string public message; // Change value when callFoo() (line 29) function execute becase we use "call"
    uint256 public x; // Change value when callFoo() (line 29) function execute becase we use "call"

    event Log(string message);

    fallback() external payable {
        emit Log("fallback was called");
    }

    receive() external payable {}

    function foo(string memory _message, uint256 _x)
        external
        payable
        returns (bool, uint256)
    {
        message = _message;
        x = _x;

        return (true, 999);
    }

    function getBalance() external view returns (uint256) {
        // Get balance of contract (~ ETH of owner create this contract)
        return address(this).balance;
    }
}

contract Call {
    bytes public data;
    string public message; // NOT change value when callFoo() (line 29) function execute becase we use "call"
    uint256 public x; // NOT change value when callFoo() (line 29) function execute becase we use "call"

    function callFoo(address _test) external payable {
        (bool success, bytes memory _data) = _test.call{value: msg.value}(
            abi.encodeWithSignature(
                "foo(string,uint256)",
                "call foo message",
                7
            )
        );

        require(success, "call failed");
        data = _data;
    }

    function callDoesNotExist(address _test) external {
        (bool success, ) = _test.call(
            abi.encodeWithSignature("doesNotExistFunction()")
        );

        require(success, "call failed");
    }
}
