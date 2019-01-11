let Game = artifacts.require("./Game.sol");
let Rogue = artifacts.require("./Classes/Rogue.sol");
let Wizard = artifacts.require("./Classes/Wizard.sol");
let Barbarian = artifacts.require("./Classes/Barbarian.sol");

module.exports = function(deployer) {
  let _game;
  deployer.deploy(Game).then((instance) =>{
    _game = instance;
    return deployer.deploy(Rogue);
  }).then(() =>{
    return _game.addClass("Rogue", Rogue.address);
  }).then(() =>{
    return deployer.deploy(Wizard);
  }).then(() =>{
    return _game.addClass("Wizard", Wizard.address);
  }).then(() =>{
    return deployer.deploy(Barbarian);
  }).then(() =>{
    return _game.addClass("Barbarian", Barbarian.address);
  });
};
