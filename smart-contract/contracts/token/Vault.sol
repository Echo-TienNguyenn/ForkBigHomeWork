// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Vault {
    mapping(address => uint256) _balance;

    receive() external payable {
        _balance[msg.sender] += msg.value;
    }

    function deposit() external payable {
        _balance[msg.sender] += msg.value;
    }

    function withdrawl(uint256 amount) public returns (bool) {
        require(_balance[msg.sender] >= amount, "Balance invalid");
        (bool success, ) = msg.sender.call{value: amount}("");
        _balance[msg.sender] -= amount;
        return success;
    }

    function balance(address account) public view returns(uint){
        return _balance[account];
    }

    // transferVault(to,amount)
    // transferFromVault(from,to,amount)
    // appoveVault(spender,amount)
}
