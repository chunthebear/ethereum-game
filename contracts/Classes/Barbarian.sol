pragma solidity ^0.5.0;

import "../Class.sol";
import "../Skills/Cleave.sol";

contract Barbarian is Class("Barbarian", 20, 2, 2, 16, 1){
    constructor() public{
        _skills.push(new Cleave());
    }
}