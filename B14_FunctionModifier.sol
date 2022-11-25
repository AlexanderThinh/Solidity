//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

//Modifier ~ define logic in a function once and reuse it in many places
contract FunctionModifier {
    bool public paused;
    uint public count;

    function setPause() external {
        paused = !paused;
    }

    modifier WhenNoPaused() {
        require(!paused, "Error: transaction was paused");
        _;
    }

    function inc() external  {       
        require(!paused, "Error: transaction was paused");
        count += 1;
    }

    function dec() external WhenNoPaused {
        count -= 1;
    }

    modifier Cap(uint _x) {
        require(_x < 100, "Error: x >= 100");
        _;
    }

    function incByValue(uint _x) external WhenNoPaused Cap(_x) {
        count += _x;
    }

    /* when run foo function (line 45). The transaction will execute line 40, 
        then line 46 (because compiler see _; in line 41), finally is line 42
    */
    modifier sandwich() {
        count += 10;
        _;
        count *= 2;
    }

    function foo() external sandwich {
        count += 1;
    }
}

contract FunctionModifier2 {
    uint public num;
    uint public numMain;

    event Test1();
    event Test2();
    event Test3();
    event Test4();
    event Test5();
    event Test6();
    event Main();

    modifier test1() {
        emit Test1();
        _;
        emit Test3();
    }

    modifier test2() {
        emit Test2();
        _;
        emit Test4();                               // test1, test2, test5, main, test6, test4, test3
    }

    modifier test3() {
        emit Test5();
        _;
        emit Test6();
    }

    function main() external test1 test2 test3 {
        emit Main();
    }

    /* Explain
        Function main(line 80) -> modifier test1 (run line 63),
        when see _; (line 64) compiler will run into the next modifier (test2), run line 69,
        when see _; (line 70) compiler will run into the next modifier (test3), run line 75,
        when see _; (line 76) compiler will run into the next modifier, 
        but there is no modifier anymore, compiler will run the main function (line 81),
        compiler comeback run line 77, line 71, line 65 and finish
    */ 

    modifier test4() {
        emit Test1();
        _;
    }

    modifier test5() {
        emit Test2();
        _;                              // test1, test2, test5, main, test6, test4, test3
    }

    modifier test6() {
        emit Test5();
        _;
    }

    function main2() external test4 test5 test6 {
        emit Main();
    }

    /* Explain
        Function main(line 108) -> modifier test4 (run line 94),
        when see _; (line 95) compiler will run into the next modifier (test5), run line 99,
        when see _; (line 100) compiler will run into the next modifier (test6), run line 104,
        when see _; (line 105) compiler will run into the next modifier, 
        but there is no modifier anymore, compiler will run the main function (line 109),
        finish
    */
}