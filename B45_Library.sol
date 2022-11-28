//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

library Math {
    function max(uint256 x, uint256 y) internal pure returns (uint256) {
        return x >= y ? x : y;
    }
}

contract TestMaxNumber {
    function testMaxNumber(uint256 x, uint256 y)
        external
        pure
        returns (uint256)
    {
        return Math.max(x, y);
    }
}

library ArrayLib {
    function findIndexByValue(uint256[] storage arr, uint256 value)
        internal
        view
        returns (uint256)
    {
        for (uint256 i = 0; i < arr.length; i++) {
            if (arr[i] == value) {
                return i;
            }
        }

        revert("Not found value in array");
    }
}

contract TestArray {
    using ArrayLib for uint256[];
    uint256[] public arr = [3, 2, 1];

    function testArray(uint256 x) external view returns (uint256 i) {
        // return ArrayLib.findIndexByValue(arr, x);
        return arr.findIndexByValue(x);
    }
}
