pragma solidity ^0.5.0;

import "../Class.sol";

contract Rogue is Class{
    function getName() public pure returns (string memory){
        return "Rogue";
    }
}