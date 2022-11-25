//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

//Data Location: Storage, memory, calldata

contract StorageMemoryCalldata {
    struct MyStruct {
        uint foo;
        string text;
    }

    mapping(address => MyStruct) public myStructs;

    function example(uint[] memory y, string memory s) external returns (uint[] memory) {
        myStructs[msg.sender] = MyStruct(123, "bar");

        // use "stotage" when you want to change value
        MyStruct storage myStruct = myStructs[msg.sender];
        myStruct.text = "foo";

        // use "memory" when you just want to read
        MyStruct memory readOnly = myStructs[msg.sender];
        readOnly.text = "foo";

        uint[] memory memArr = new uint[](3);
        memArr[0] = 777;
        return memArr;
    }
}