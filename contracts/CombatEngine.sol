pragma solidity ^0.5.0;

import "./Game.sol";
import "./Character.sol";
import "./Skill.sol";
import "./Libraries/SafeMath.sol";

contract CombatEngine{
    using SafeMath for uint;

    uint private PHYSICAL_SKILL = 1;
    uint private MAGICAL_SKILL = 2;


    function attack(Character attacker, Character defender, Skill skill) public view returns (uint){
        //strength is defence, agility is avoidance
        if (skill.getSkillType() == PHYSICAL_SKILL){
            return (attacker.getStrength() * 2 + attacker.getAgility() -
                    defender.getAgility() * 2 + defender.getStrength() + attacker.getAgility() / 4);
        } else if (skill.getSkillType() == MAGICAL_SKILL){
            return (attacker.getIntelligence() * 2 + attacker.getAgility() + skill.getDamage() - 
                    defender.getAgility() * 2 + defender.getIntelligence());
        }
        return 0;
    }
}