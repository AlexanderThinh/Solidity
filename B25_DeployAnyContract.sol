//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract TestContract1 {
    address public owner = msg.sender;

    function setOwner(address _owner) public {
        require(msg.sender == owner, "Unauthorized");
        owner = _owner;
    }
}

contract TestContract2 {
    address public owner = msg.sender;
    uint public value = msg.value;
    uint public x;
    uint public y;

    constructor (uint _x, uint _y) payable {
        x = _x;
        y = _y;
    }
}

contract Proxy {
    event Deploy(address);

    function deploy(bytes memory _code) external payable returns(address addr) {
        assembly {
            addr := create(callvalue(), add(_code, 0x20), mload(_code));
        }

        require(addr != address(0), "Deploy fail");
        emit Deploy(addr)
    }

    function execute(address _target, bytes memory _data) {
        external
        payable
         {
             (bool sucess, ) = target.call{value: msg.value} {_data};
             require(success, "failed");
    }
}