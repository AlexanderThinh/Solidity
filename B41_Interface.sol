//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

interface ICounter {
    function count() external view returns (uint);
    function inc() external;
    function incByValue(uint value) external;
}

/*
    Suppose that there are a thousand of line code in body of contract Counter,
    so if you want to execute code in line 31, you must copy all code in body of contract Counter and paste in your contract,
    Now you don't have to do that, let's use interface (line 4 -> line 7)
*/
contract Counter {
    uint public count;

    function inc() external {
        count += 1;
    }

    function incByValue(uint value) external {
        count += value;
    }
}

contract CallInterface {
    uint public count;

    function inc(address _counter) external {
        // Counter(_counter).inc();
        ICounter(_counter).inc();
        count = ICounter(_counter).count();
    }

    function incByValue(address _counter, uint value) external {
        ICounter(_counter).incByValue(value);
        count = ICounter(_counter).count();
    }
}