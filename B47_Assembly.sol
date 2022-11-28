//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Assembly {
    uint256 public a;
    string public testString = "123456789112345678911234567891123456";

    function sumAssembly(uint256 _x, uint256 _y)
        external
        pure
        returns (uint256)
    {
        assembly {
            let result := add(_x, _y)
            let myString := "123456789112345678911234567891" // Error when string.length > 32 (~ 32 bytes)
            mstore(0x0, result) // save data (result) into memomy address 0x0
            return(0x0, 32) // return 32 bytes from memory address 0x0
            let k := mload(0x0)
        }
    }

    function sum(uint256 _x, uint256 _y) external pure returns (uint256) {
        return _x + _y;
    }

    function forLoopAssembly(uint256 _n) public pure returns (uint256) {
        assembly {
            let result
            for {
                let i := 1
            } lt(i, add(_n, 1)) {
                i := add(i, 1)
            } {
                result := add(i, result)
            }

            mstore(0x0, result)
            return(0x0, 32)
        }
    }

    function forLoop(uint256 _n) external pure returns (uint256 result) {
        for (uint256 i = 1; i < _n + 1; i++) {
            result += i;
        }
    }

    function foo2() external pure returns (bytes32 r) {
        assembly {
            r := mload(0x70) // Return a next address available slot in memory from address 0x70
            mstore(r, 7) // Save data (7) in address r in memory directly
        }
    }

    function testMload() external pure returns (bytes memory) {
        assembly {
            let myString := "123456789112345678911234567891" // Error when string.length > 32 (~ 32 bytes)
            mstore(0x0, myString) // save data (result) into memomy address 0x0
            return(0x0, 32) // return 32 bytes from memory address 0x0
            let k := mload(0x0)
        }
    }
}
