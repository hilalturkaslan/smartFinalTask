pragma solidity ^0.8.7;
//SPDX-License-Identifier: MIT 

contract Smart{
    uint public accountNo;
    uint public playerId;
    
    
    constructor(uint number, uint idNo){
        // account number specified as a number
        accountNo = number;
        // user id specified as id number
        playerId = idNo;
    }

    struct Player {
        //player number
        uint id;
        //player's address
        address sender;
        Game[] game;
        Account[] account;
    }

    struct Game {
        //id of the game
        uint id;
        //products of the game are defined
        string product;
        //the categories of the game are defined
        string category;
        Character[] character;
        // state variable definition 
        string english ; //"the language of the game is english"
        // specifying the language
        string turkish ; //"the language of the game is turkish"
    }

    struct Character {
        //character number is defined
        uint id;
        //character traits are defined
        string feature;
    }

    struct Account {
        //account id number is defined
        uint id;
        Player[] Player;
        //sending of account address is defined
        address sender;
    }



    function situation(uint number, uint idNo) public {
        require(number == idNo,"each user has their own account number");
    }

    event Library(
        uint id,
        address indexed sender,
        string category,
        string product,
        string english,
        string turkish,
        string feature
    );
    
    uint public characterId;
    address public owner;
    mapping (uint => Library) public libraries;

    constructor(){
        owner = msg.sender;
    }

    function statee(
      string _category,
      string _product,
      string _english,
      string _turkish,
      string _feature
    )external  {
        require (_english == _turkish, "available in two languages");
        require (_feature > 10, "feature is enough.");
        require (_product >1, "The number of products must be more than 1");
        require (_category >3, "The number of categories must be more than 3");

        characterId += 1;
        libraries[characterId] = Library({
            category: _category,
            product: _product,
            english: _english,
            turkish: _turkish,
            feature: _feature
        });

        emit Library(characterId, _category, _product, _english, _turkish, _feature, msg.sender);
    }

    function updateGame(string _category) external view returns(Game){
        return Game[_category];
    }

    modifier gameState(string _category){
        _;
        count ++;
    }

    modifier gameIdd {
        id ++;
        _;
    }

    function foo() external gameState{
        count ++; 
    }
     
    function foo() external gameIdd{
        id ++; 
    }




    string[] public categoryName = ["adventure","action","science fiction","crossword","sports"];
    
    function returnCategory() public view returns (string[]){
        return categoryName;
    }

    
}


