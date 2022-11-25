//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Array {
    uint[] public nums = [1, 2, 3];
    uint[3] public numsFixed = [4, 5, 6];

    function arrayExample() external {
        nums.push(4); //[1, 2, 3, 4];
        uint x = nums[1];
        nums[2] = 777; // [1, 2, 777, 4];
        delete nums[1]; // [1, 0, 777, 4];
        nums.pop(); // [1, 0, 777];

        uint arrLength = nums.length;

        //create array in memory
        uint[] memory a = new uint[](5);
    }

    //Return an array in function (Not recommend)
    function returnArray() external view returns (uint[] memory) {
        return nums;
    }

    //Remove an array element by index
    function checkArrayValueExist(uint[] memory myArr, uint value) external pure returns (bool) {
        // require(_index < myArr.length, "Error: index out of bound");

        for(uint i = 0; i < myArr.length; i++) {
            if(myArr[i] == value) {
                return true;
            }
        }

        return false;
    }

    function checkArrayValueExistMain(uint value) external view returns (bool) {
        return this.checkArrayValueExist(nums, value);
    }
}