pragma solidity ^0.5.0;

import "../Class.sol";
import "../Skills/Backstab.sol";

contract Rogue is Class("Rogue", 15, 10, 5, 5) {
    constructor() public{
        _skills.push(new Backstab());
    }
}