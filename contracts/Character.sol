pragma solidity ^0.5.0;

import "./Class.sol";
import "./Libraries/SafeMath.sol";

contract Character{

    using SafeMath for uint;

    address private _game;

    string private _name;
    Class private _class;

    uint private _hitPoints;
    uint private _agility;
    uint private _intelligence;
    uint private _strength;

    uint private _experience;
    uint private _level;

    uint8 private _exist; //to check someone has created a character in Game.sol

    //only msg.sender (the game contract) can change hit points and other status
    modifier isGame{
        require(msg.sender == _game, "Request not from game");
        _;
    }

    constructor(string memory name, Class class) public{
        _name = name;
        _class = class;
        _game = msg.sender;
        _exist = 1;
    }

    function isExist() public view returns (uint8){
        return _exist;
    }

    function getName() public view returns(string memory){
        return _name;
    }

    function getClass() public view returns(Class){
        return _class;
    }

    function getHitPoints() public view returns (uint){
        return _hitPoints.add(_class.getHitPoints());
    }

    function getAgility() public view returns (uint){
        return _agility.add(_class.getAgility());
    }

    function getIntelligence() public view returns (uint){
        return _intelligence.add(_class.getIntelligence());
    }

    function getStrength() public view returns (uint){
        return _strength.add(_class.getStrength());
    }

    function getExperience() public view returns (uint){
        return _experience;
    }

    function getLevel() public view returns (uint){
        return _level;
    }

    function setLevel(uint level) public isGame{
        _level = level;
    }

    function setExperience(uint experience) public isGame{
        _experience = experience;
    }

    function setHitPoints(uint hitPoints) public isGame{
        _hitPoints = hitPoints;
    }

    function setAgility(uint agility) public isGame{
        _agility = agility;
    }

    function setIntelligence(uint intelligence) public isGame{
        _intelligence = intelligence;
    }

    function setStrength(uint strength) public isGame{
        _strength = strength;
    }

    
}