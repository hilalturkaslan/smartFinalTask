pragma solidity ^0.8.7;
//SPDX-License-Identifier: MIT  

contract FeeCollector { //0xd9145CCE52D386f254917e481eB44e9943F39138
    address public owner;
    uint256 public balance;

    constructor(){
        owner = msg.sender;
    }

    receive() payable external{
        balance += msg.value;
    }


    function withdraw(uint amount, address payable destAddr) public {
        require(msg.sender == owner, "Only owner can withdraw");
        require(amount <= balance, "Insufficient funds");

        destAddr.transfer(amount);
        balance -= amount;
    }

}