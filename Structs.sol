// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Structs {
    struct Car {
        string model;
        uint year;
        address owner;
    }
    Car public car;
    Car[] public cars;
    mapping(address =>Car[]) public carsByOwner;

    function examples() external {
        // car variable onyl exists while function is being called
        Car memory toyota = Car("Supra", 1990, msg.sender);
        //if passing by key value pair can be any order
        Car memory lambo = Car({model: "Lambo", year: 1980, owner: msg.sender});
        Car memory tesla;
        tesla.model = "Telsa";
        tesla.year = 2010;
        tesla.owner = msg.sender;

        cars.push(toyota);
        cars.push(tesla);
        cars.push(lambo);

        // create a struct and then immediatly push to array
        cars.push(Car("Ferrari", 2020, msg.sender));

        // If wanting to change the value need to change the keyword to storage instead of memory
        Car memory _car = cars[0];
        _car.model;
        _car.year;
        _car.owner;

        // delete will reset the field to default value
        delete _car.owner;

        delete cars[1]; // reset the whole item in struct to defualt values

    }
}
