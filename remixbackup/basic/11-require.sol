// SPDX-License-Identifier: Apache-2.0
pragma solidity^0.8.7; 

contract money_demo {
    address public admin;
    address payable public user;
    uint256 totalAmount;
    
    constructor(address _owner) {
        admin = _owner;
    }
    
    function deposit(uint256 _amount) public payable {
        //if (_amount != msg.value) return;
        require(_amount == msg.value, "amount must == msg.value");
        assert(_amount > 0);
        user = payable(msg.sender);
        totalAmount = _amount;
        //address(this).balance += _amount;
    }
    
    function getBalance() public view returns (uint256, uint256) {
        //this dai biao he yue ben shen 
        // account's balance 
        return (address(this).balance, totalAmount);
    }
    
    function withdraw(uint256 _amount) public payable {
        user.transfer(_amount);
    }
}