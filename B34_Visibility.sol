//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

/*
    4 Visibility:
    - private: only inside contract
    - internal: only inside contract and child contract
    - public: inside and outside contract
    - external: only from outside contract
*/

/*
    _________________________
   |                         |          
   | contract A              |   
   | private        pri()    |           _________________
   | internal       inter()  |  <====== |                 |
   | public         pub()    |          | contract C      |
   | external       ext()    |          | pub()           |
   |_________________________|          | ext()           |
                                        |_________________|
    _________________________
   |                         |
   | contract B is A         | 
   | inter()                 |
   | pub()                   |
   |_________________________|
*/

contract VisibilityBase {
    uint private x = 0;
    uint internal y = 1;
    uint public z = 2;

    function privateFunction() private pure returns (string memory) {
        return "private";
    }

    function internalFunction() internal pure returns (string memory) {
        return "internal";
    }

    function publicFunction() public pure returns (string memory) {
        return "public";
    }

    function externalFunction() external pure returns (string memory) {
        return "external";
    }

    function example() external view {
        x + y + z;

        privateFunction();
        internalFunction();
        publicFunction();
        // externalFunction(); // Can't call an external function in here, but trick is "this.externalFunction()"
    }
}

contract VisibilityChild is VisibilityBase {
    function example2() external view {
        y + z;

        internalFunction();
        publicFunction();
        // externalFunction(); // Can't call an external function in here, but trick is "this.externalFunction()"
    }
}