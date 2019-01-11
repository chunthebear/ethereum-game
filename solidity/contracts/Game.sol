pragma solidity ^0.5.0;

import "./Character.sol";

contract Game{
    mapping(address => Character) private _characters;

    /* notes to self:
    msg.sender is the owner of the contract

    "memory" means the data is not in storage.
    It creates space for the var at method runtime, 
    guaranteeing the size and structure for future use in the method 

    The Ethereum Virtual Machine has three areas where it can store items:

    The first is “storage”, where all the contract state variables reside. 
    Every contract has its own storage and it is persistent between function calls and quite expensive to use.

    The second is “memory”, this is used to hold temporary values. 
    It is erased between (external) function calls and is cheaper to use.

    The third one is the stack, which is used to hold small local variables. 
    It is almost free to use, but can only hold a limited amount of values.
    */

    function createCharacter(string memory name) public {
        _characters[msg.sender] = new Character(name);
    }


    function getCharacter() public view returns (Character){
        return _characters[msg.sender];
    }
}