
pragma solidity ^0.4.18;

/**
 * Copyright (C) 2018  Ducatur, LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License").
 * You may not use this file except in compliance with the License.
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND (express or implied).
 */
    
contract Bet {
	
    address public owner;
    address public opponent;
    uint256 public rate;
    uint256 public minanswer;
    uint256 public predictrate;
    enum Stage {bet,answer,rag}
    Stage stage;

    modifier onlyOracle() {
	if(oracle!=msg.sender) revert();
        _;	

    }

    function Bet(uint256 _minanswer, address _oracle, uint256 _predictrate ) {
	    oracle = _oracle
        minanswer = _minanswer
        predictrate = _predictrate
        stage = Stage.bet;
        owner = msg.sender

        //get main bet
        
    }
    
    function Answer(uint256 _amount) {
        require(_amount > _minanswer );
        opponent = msg.sender;
        stage = Stage.answer;
        //get answer bet
        
    }
    
    function getWon() {
        require(stage == Stage.rag); 
        // decide to won
        if (predictrate > rate && owner == msg.sender ) {
            owner.transfer(this.balance);
        } else {
            opponent.transfer(this.balance);
        }
        
    }

   function _(uint256 _rate) onlyOracle {
	rate = _rate;
    stage = Stage.rag;

   }
}    


