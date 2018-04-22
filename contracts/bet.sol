
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
    //address public oracle = '0x1979C2A9D21F9f8FFB73F0a81CE9823c4F306eaF';
    address constant public oracle = 0x1979C2A9D21F9f8FFB73F0a81CE9823c4F306eaF;

    enum Stage {bet,answer,rag}
    Stage stage;
    modifier onlyOracle() {
	if(oracle!=msg.sender) revert();
        _;	
    }

    function Bet(uint256 _minanswer, uint256 _predictrate ) {
        minanswer = _minanswer
        predictrate = _predictrate
        stage = Stage.bet;
        owner = msg.sender
    }
    
    function Answer() payable {
        require( msg.value > minanswer );
        opponent = msg.sender;
        stage = Stage.answer;

    }
    
    function getWon() {
        require(stage == Stage.rag); 
        if (predictrate > rate && owner == msg.sender ) {
            owner.transfer(this.balance);
        } else {
            opponent.transfer(this.balance);
        }
    }

   function setRate(uint256 _rate) onlyOracle {
	rate = _rate;
    stage = Stage.rag;
   }
}    

contract fabric {
    address public owner;

    modifier onlyOwner() {
	if(owner!=msg.sender) revert();
        _;	
    }

    function fabric() {
        owner = msg.sender;
    }

    function createBet(uint256 _minanswer, uint256 _predictrate) {
        
    }
}

