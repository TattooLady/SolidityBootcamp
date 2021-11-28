// SPDX-License-Identifier: MIT
// Executing a Simple Smart Contract with Solidity
// Solidity Basics

pragma solidity ^0.6.0;
// Define your solidity version 


//make a habit of hitting command s to compile
contract SimpleStorage {

    //this will get initialized to 0!
    uint256 favoriteNumber;
    bool favoriteBool;

    //Create struct for storing names and favorite numbers
    struct People {
        uint256 favoriteNumber;
        string name;
    }

    //initialize object  
    People [] public people;
    mapping(string => uint256) public nameToFavoriteNumber;

    //favorite number function
    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }
    
    //add person function
    function addPerson(string memory _name, uint256 _favoriteNumber) public{
        people.push(People(_favoriteNumber, _name));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }

    //view, pure
    function retrieve() public view returns(uint256) {
        return favoriteNumber;
    }

    

}
