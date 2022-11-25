//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Struct {
    struct Car {
        string model;
        uint year;
        address owner;
    }

    // Car public car;
    Car[] public cars;
    mapping(address => Car[]) public carByOwner;

    function example() external {
        Car memory toyota = Car("Toyota", 1999, msg.sender);
        Car memory peugeot = Car("Peugeot", 1992, msg.sender);

        Car memory tesla;
        tesla.model = "Tesla";
        tesla.year = 2010;
        tesla.owner = msg.sender;

        cars.push(toyota);
        cars.push(peugeot);
        cars.push(tesla);
        cars.push(Car("Ferrari", 1996, msg.sender));
    }

    function getInfoCarByIndex(uint index) external view returns(Car memory) {
        Car memory _car = cars[index];

        return _car;
    }

    //When change value in 1 truong of struct, you must declare with "storage" (line 40)
    function changeYearCarByIndex(uint index) external {
        require(index < cars.length, "404 Not found");

        Car storage _car = cars[index];
        _car.year = 2000;
    }

    function resetOwnerCarByIndex(uint index) external {
        require(index < cars.length, "404 Not found");

        Car storage _car = cars[index];
        delete _car.owner;
    }

    function resetFullCarByIndex(uint index) external {
        require(index < cars.length, "404 Not found");

        // Car storage _car = cars[index];
        // delete _car;

        delete cars[index]; // model = "", year = 0, owner = 0x0
    }
}