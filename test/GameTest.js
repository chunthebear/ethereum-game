let Game = artifacts.require("./Game.sol");
let Character = artifacts.require("./Character.sol");
let Class = artifacts.require("./Class.sol");

const PROVIDED_NAME = "TEST";
const PROVIDED_CLASS = "Barbarian";

contract("Game", (accounts) => {
    let creatorAccount = accounts[0];
    /* note to self:
    "it" is used for the Jasmine testing framework
    "accounts" stores all Ethereum accounts
    */
    let _game;
    it("should create a character with the name and class provided", () => {
        //let _game;
        let _character;
        let _class;

        /* console lines:
        Game.deployed().then(instance =>{ _game = instance; return _game.createCharacter("Yichun", "Barbarian")}).then(()=>{return _game.getCharacter()}).then(instance =>{return Character.at(instance).getName()});
        */

        return Game.deployed() //to get the state of the game
        .then(instance => { //then use the instance of game to create character from creatorAcc
            _game = instance;
            return _game.createCharacter(PROVIDED_NAME, PROVIDED_CLASS, {from: creatorAccount});
        }).then(() => { //then get the character from the instance of game
            return _game.getCharacter();
        }).then(instance => { //then get the name from the instance of character (address)
            _character = Character.at(instance); 
            return _character.getName();
        }).then(name => { 
            assert.equal(name, PROVIDED_NAME, "Failed to create a character with the provided name");
            return _character.getClass(); //then get the class from the instance of character
        }).then(instance => { //then get the name from the instance of class (address)
            _class = Class.at(instance);
            return _class.getName();
        }).then(name => {
            assert.equal(name, PROVIDED_CLASS, "Failed to create a character with the provided class");
        });
    });
});