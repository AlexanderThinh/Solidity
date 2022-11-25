//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Error {
    //require
    function testRequire(uint _i) public pure {
        //If _i <= 10 then your code will execute, else your code is not execute => Error (x)
        require(_i <= 10, "Error: i > 10");

        //Your code
    }

    //revert
    function testRevert(uint _i) public pure {
        if(_i > 10) {
            revert("Error: i > 10");
        }
    }

    //assert: check a condition is alway true, unless the smart contract has bug
    uint public num = 7;

    function testAssert() public view {
        assert(num == 123);
    }

    function inceaseNum() public {
        num += 1;
    }

    function foo(uint i) public {
        /* ~ num += 1;
             require(i < 10);
        */ 
        if(i <= 10) {
            num += 1;
        }
    }

    error myError(address caller, uint i);

    //Custom error
    function CustomError(uint i) public view {
        if(i > 10) {
            revert myError(msg.sender, i);
        }
    }
}