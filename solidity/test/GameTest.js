let Game = artifacts.require("./Game.sol");
let Character = artifacts.require("./Character.sol");

const PROVIDED_NAME = "TEST";

contract("Game", (accounts) => {
    let creatorAccount = accounts[0];
    /* note to self:
    "it" is used for the Jasmine testing framework
    "accounts" stores all Ethereum accounts
    */

    it("should create a character with the name provided", () => {
        let _game;
        let _character;
        return Game.deployed().then(instance => {
            _game = instance;
            return _game.createCharacter(PROVIDED_NAME, {from: creatorAccount});
        }).then(() => {
            return _game.getCharacter();
        }).then(instance => {
            _character = Character.at(instance);
            return _character.getName();
        }).then(name => {
            assert.equal(name, PROVIDED_NAME, "Failed to create a character with the provided name");
        });
    });
});