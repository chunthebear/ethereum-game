pragma solidity ^0.5.0;

import "./Class.sol";

contract Character{

    string private _name;
    Class private _class;

    uint private _hitPoints;
    uint private _agility;
    uint private _intelligence;
    uint private _strength;

    uint private _experience;
    uint private _level;

    constructor(string memory name, Class class) public{
        _name = name;
        _class = class;
    }

    function getName() public view returns(string memory){
        return _name;
    }

    function getClass() public view returns(Class){
        return _class;
    }

    function getHitPoints() public view returns (uint){
        return _hitPoints + _class.getHitPoints();
    }

    function getAgility() public view returns (uint){
        return _agility;
    }

    function getIntelligence() public view returns (uint){
        return _intelligence;
    }

    function getStrength() public view returns (uint){
        return _strength;
    }
    
}