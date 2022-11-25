//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

/*
    calling parent functions
    - direct
    - super

    E
  /   \
 F     G
  \   /
    H
*/

contract E {
    event Log(string message);

    function foo() public virtual {
        emit Log("E.foo()");
    }

    function bar() public virtual {
        emit Log("E.bar()");
    }
}

contract F is E {
    function foo() public virtual override {
        emit Log("F.foo()");
        E.foo(); // call direct
    }

    function bar() public virtual override {
        emit Log("F.bar()");
        super.bar(); // call use "super"
    }
}

contract G is E {
    function foo() public virtual override {
        emit Log("G.foo()");
        E.foo(); 
    }

    function bar() public virtual override {
        emit Log("G.bar()");
        super.bar();
    }
}

contract H is F, G {
    function foo() public override(F, G) {
        F.foo(); // call line 30 -> line 31 -> line 20
    }

    function bar() public virtual override(F, G) {
        super.bar(); // call all parent (F, G): line 47 -> line 48 -> line 35 -> line 36 -> line 24
    }
}