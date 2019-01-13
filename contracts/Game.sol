pragma solidity ^0.5.0;

import "./Character.sol";
import "./Skill.sol";
import "./Class.sol";
import "./CombatEngine.sol";

contract Game{

    address private _owner;
    mapping(address => Character) private _characters;
    mapping(string => Class) private _classes;

    CombatEngine private _combatEngine;

    //require() means if condition not true, throw exception
    //modifier is a condition check for a function
    modifier isOwner{
        require(_owner==msg.sender, "Sender is not ownder");
        _; //this returns the flow of execution to the original function that is annotated (condition-orientated programming)
    }

    //this check if character exists for the address
    modifier hasCharacter{
        require(_characters[msg.sender].isExist() == 1, "Character does not exist for address");
        _;
    }

    constructor() public{
        _owner = msg.sender;
    }

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

    function createCharacter(string memory name, string memory class) public {
        _characters[msg.sender] = new Character(name, _classes[class]);
    }

    function getCharacter() public view returns (Character){
        return _characters[msg.sender];
    }

    //"string memory key" to store def of class as key value pair to ensure picking a valid class
    function addClass(string memory key, Class class) public isOwner{
        _classes[key] = class;
    }

    function removeClass(string memory key) public isOwner{
        delete _classes[key];
    }

    function attack (Character character, Skill skill) public view returns (uint){
        _combatEngine.attack(_characters[msg.sender], character, skill);
    }
}