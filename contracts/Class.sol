pragma solidity ^0.5.0;

import "./Skill.sol";

contract Class{
    string private _name;
    uint private _hitPoints;
    uint private _agility;
    uint private _intelligence;
    uint private _strength;

    uint private _class;

    Skill[] internal _skills;

    constructor(string memory name, uint hitPoints, uint agility, uint intelligence, uint strength, uint class) public{
        _name = name;
        _hitPoints = hitPoints;
        _agility = agility;
        _intelligence = intelligence;
        _strength = strength;
        _class = class;
    }

    function getName() public view returns (string memory){
        return _name;
    }

    function getClass() public view returns(uint){
        return _class;
    }

    function getHitPoints() public view returns (uint){
        return _hitPoints;
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