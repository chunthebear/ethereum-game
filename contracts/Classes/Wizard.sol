pragma solidity ^0.5.0;

import "../Class.sol";
import "../Skills/Fireball.sol";

contract Wizard is Class("Wizard", 10, 5, 16, 2, 2) {
    constructor() public{
        _skills.push(new Fireball());
    }
}