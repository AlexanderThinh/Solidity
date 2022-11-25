//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// There are 2 way to call parent constructors

contract S {
    string public name;

    constructor (string memory _name) {
        name = _name;
    }
}

contract T {
    string public text;

    constructor (string memory _text) {
        text = _text;
    }
}

// Way 1 to inherit constructor
contract U is S("s"), T("t") {

}

// Way 2 to inherit constructor
contract V is S, T {
    constructor(string memory _name, string memory _text) S(_name) T(_text) {
        
    }
}