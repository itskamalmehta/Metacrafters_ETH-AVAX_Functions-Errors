// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract APECoin {
    string public name = "ABCoin"; // The name of the coin
    address public owner; // The owner of the contract
    mapping(address => uint) public balance; // Mapping to store balance of addresses

    // Constructor: Initializes the contract with the deployer as the owner
    constructor() {
        owner = msg.sender;
    }

    // Modifier: Ensures only the owner can execute the function
    modifier onlyOwner() {
        require(msg.sender == owner, "Only the contract owner can call this function");
        _;
    }

    // Function: Allows the owner to mint new coins and assign them to an address
    function mint(address recipient, uint amount) public onlyOwner {
        require(amount > 0, "Amount to mint must be greater than 0");

        balance[recipient] += amount; // Increase recipient's balance
        assert(balance[recipient] >= amount); // Ensure no underflow
    }

    // Function: Allows the owner to burn coins from an address
    function burn(address target, uint amount) public onlyOwner {
        require(balance[target] >= amount, "Insufficient balance to burn");

        balance[target] -= amount; // Decrease target's balance
        assert(balance[target] >= 0); // Ensure no underflow
    }
}
