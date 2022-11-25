//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

//Keyword "virtual" declare that this function of contract A (parent) can be inheritance in contract B (child)
contract A {
    function foo() public pure virtual returns (string memory) {
        return "A";
    }

    function bar() public pure virtual returns (string memory) {
        return "A";
    }

    function baz() public pure returns (string memory) {
        return "A";
    }
}

//Keyword "is" declare that contract B (child) inheritance contract A (parent)
contract B is A {
    //Keyword "override" declare that this function of contract B is overriding the same function name in contract A (parent)
    function foo() public pure override returns (string memory) {
        return "B";
    }

    function bar() public pure virtual override returns (string memory) {
        return "B";
    }
}

contract C is B {
    function bar() public pure override returns (string memory) {
        return "C";
    }
}