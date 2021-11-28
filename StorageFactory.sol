// SPDX-License_Identifier: MIT
// Step 1 is always add license
// Step 2 declare version of solidity
pragma solidity ^0.6.0;

//Step 3 import contract file path
// ALLOWS IMPORT OF FUNCTIONALITY FROM OTHER CONTRACTS
import "./SimpleStorage.sol";

// Step 4 generate a contract of simple storage type
// can inherit functions of other contracts
contract StorageFactory is SimpleStorage {

// Step 6 put the contracts in a list / initialize array
// Every time we create a new Simplestorage contract it will be added to the array
    SimpleStorage[] public simpleStorageArray;

// Step 5 name it simpleStorage, and 
// this creates is a new instance of SimpleStorage contract 
// and prints the contract to our array
    function createSimpleStorageContract() public{
        SimpleStorage simpleStorage = new SimpleStorage();
        simpleStorageArray .push(simpleStorage);
    }
// Step 7 You can call a contract, from another contract and deploy those functins as well
// create store and retrieve functions, 
    function sfStore(uint256 _simpleStorageIndex, uint256 _simpleStorageNumber) public {
        // WChoose which simpleStorage contract to interact with on array/list
        // Address
        // ABI (Application Binary Interface)
        SimpleStorage simpleStorage = SimpleStorage(address(simpleStorageArray[_simpleStorageIndex]));
        simpleStorage.store(_simpleStorageNumber);
    }
// Retrieve method for favoriteNumber, call from array
    function sfGet(uint256 _simpleStorageIndex) public view returns (uint256) {
        SimpleStorage simpleStorage = SimpleStorage(address(simpleStorageArray[_simpleStorageIndex]));
        return simpleStorage.retrieve();
    }
}
