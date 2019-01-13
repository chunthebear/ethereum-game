pragma solidity ^0.5.0;

import "./Class.sol";

contract Skill{
    string private _name;
    uint private _levelRequired;
    uint private _damage;
    uint private _class; //use uint for class for cheaper comparison 
    uint private _skillType;

    constructor(string memory name, uint levelRequired, uint damage, uint class, uint skillType) public {
        _name = name;
        _damage = damage;
        _levelRequired = levelRequired;
        _class = class;
        _skillType = skillType;
    }

    function getName() public view returns(string memory){
        return _name;
    }

    function getLevelRequired() public view returns(uint){
        return _levelRequired;
    }

    function getDamage() public view returns(uint){
        return _damage;
    }

    function getClass() public view returns(uint){
        return _class;
    }

    function getSkillType() public view returns(uint){
        return _skillType;
    }
}