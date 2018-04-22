
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
    гште256 public rate;

    modifier onlyOracle() {
	if(oracle!=msg.sender) revert();
        _;	

    }
    function Bet(uint256 amount) {
	oracle = ''
        //get main bet
        
    }
    
    function Answer() {
        //get answer bet
        
    }
    
    function getWon() {
        // decide to won
        
    }

   function _(uint256 _rate) onlyOracle {
	rate = _rate;
   }
}    


