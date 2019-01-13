pragma solidity ^0.5.0;

import "./Class.sol";

contract Skill{
    string private _name;
    uint private _levelRequired;
    uint private _damage;
    string private _class;

    constructor(string memory name, uint levelRequired, uint damage, string memory class) public {
        _name = name;
        _damage = damage;
        _levelRequired = levelRequired;
        _class = class;
    }

    function getName() public view returns(string){
        return _name;
    }

    function getLevelRequired() public view returns(uint){
        return _levelRequired;
    }

    function getDamage() public view returns(uint){
        return _damage;
    }

    function getClass() public view returns(string memory){
        return _class;
    }
}