//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

/*
    "abi.encode" and "abi.encodePacked" deu ma hoa DL thanh byte, nhung
    - "abi.encodePacked" nen DL input, dau ra se nho hon va lam giam mot so thong tin so voi "abi.encode"
*/

contract Keccak256HashFunction {
    function hash(
        string memory text,
        uint256 num,
        address addr
    ) external pure returns (bytes32) {
        return keccak256(abi.encodePacked(text, num, addr));
    }

    function encode(string memory text0, string memory text1)
        external
        pure
        returns (bytes memory)
    {
        return abi.encode(text0, text1);
    }

    function encodePacked(string memory text0, string memory text1)
        external
        pure
        returns (bytes memory)
    {
        return abi.encodePacked(text0, text1);
    }

    function collision(string memory text0, string memory text1)
        external
        pure
        returns (bytes32)
    {
        return keccak256(abi.encodePacked(text0, text1));
    }
}
