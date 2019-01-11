pragma solidity ^0.5.0;

contract Class{
    //pure means promised not to modify or read the state (storage state)
    function getName() public pure returns (string memory);
}