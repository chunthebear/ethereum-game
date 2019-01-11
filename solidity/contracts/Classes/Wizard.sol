pragma solidity ^0.5.0;

import "../Class.sol";

contract Wizard is Class {
    function getName() public pure returns (string memory){
        return "Wizard";
    }
}