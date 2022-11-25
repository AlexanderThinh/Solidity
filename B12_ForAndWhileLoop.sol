//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract ForAndWhileLoop {
    function loop(uint x) external pure returns (uint) {
        for(uint i = 0; i < 7; i++) {
            x += 1;

            if(i == 3) {
                continue;
            }

            x += 1;

            if(i == 5) {
                break;
            }
        }

        uint j = 0;
        while (j < 10) {
            j++;
        }

        return x;
    }

    function example2() external pure returns (uint) {
        uint j = 0;
        while (j < 10) {
            j++;
        }

        return j;
    }

    function sum(uint n) external pure returns (uint) {
        uint s;

        for(uint i = 1; i <= n; i++) {
            s += 1;
        }

        return s;
    }
}