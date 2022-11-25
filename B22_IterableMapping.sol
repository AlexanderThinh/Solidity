//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract IterableMapping {
    mapping(address => uint) public balances;
    mapping(address => bool) public inserted;
    address[] public keys;

    function set(address _key, uint _value) external {
        balances[_key] = _value;

        if(!inserted[_key]) {
            inserted[_key] = true;
            keys.push(_key);
        }
    }

    //Get length of balances
    function getSize() external view returns(uint) {
        return keys.length;
    }

    function getFirstBalance() external view returns(uint) {
        return balances[keys[0]];
    }

    function getLastBalance() external view returns(uint) {
        return balances[keys[keys.length - 1]];
    }

    function getSomewhereBalance(uint i) external view returns(uint) {
        return balances[keys[i - 1]];
    }
}