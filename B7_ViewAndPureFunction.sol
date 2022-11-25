//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract ViewAndPureFunction {
    uint public num;

    //View function is function has activity to state variable (num)
    function viewFunc() external view returns (uint) {
        return num;
    }

    //Pure function is function doesn't has activity to state variable
    function pureFunc() external pure returns (uint) {
        return 1;
    }

    //View function is function has activity to state variable (num)
    function addToNum(uint x) external view returns (uint) {
        return num + x;
    }

    //Pure function is function doesn't has activity to state variable
    function add(uint x, uint y) external pure returns (uint) {
        return x + y;
    }

    // function changeValue() external view returns (uint) {
    //     num += 1;
    // }

    function changeValue2() external {
        num += 1;
    }

    function showNumValue() external view returns (uint) {
        return num;
    }

    function showValue() external returns (uint) {
        this.changeValue2();

        return num;
    }
}