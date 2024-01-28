//SPDX-License-Identifier:MIT
pragma solidity ^0.8.15;

contract lottery{
    address public owner;
    address payable [] public players;
    address [] public winners;
    uint public lotteryId;

    constructor(){
    owner=msg.sender;
    lotteryId=0;
}
   function enter() public payable{
    require(msg.value >=0.1 ether);
    players.push(payable(msg.sender));
   }
   function getplayers() public view returns(address payable[] memory){
    return players;
   }
   function getbalance() public view returns(uint){
    return address(this).balance;
   }
   function getlotteryId() public view returns(uint){
    return lotteryId;
   } 
   function getRandomNumber() public view returns(uint){
    return uint(keccak256(abi.encodePacked(owner,block.timestamp)));
   } 
   function pickWinner() public{
    require(msg.sender == owner);
    uint randomIndex = getRandomNumber() % players.length;
    players[randomIndex].transfer(address(this).balance);
    winners.push(players[randomIndex]);
    lotteryId++;

    players = new address payable[](0);
   }
   function getWinners() public view returns (address[] memory){
    return winners;
   }
}