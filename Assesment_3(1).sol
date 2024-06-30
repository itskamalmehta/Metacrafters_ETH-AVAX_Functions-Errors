// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract APECoin {
    string public Coin_Name = "APECoin"; // The name of the coin
    address public owner; // The owner of the contract
    mapping(address => uint) public balances; // Mapping to store balances of addresses

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

        balances[recipient] += amount; // Increase recipient's balance
        assert(balances[recipient] >= amount); // Ensure no underflow
    }

    // Function: Allows the owner to burn coins from an address
    function burn(address _address, uint amount) public onlyOwner {
        require(balances[_address] >= amount, "Insufficient balance to burn");

        balances[_address] -= amount; // Decrease _address's balance
        assert(balances[_address] >= 0); // Ensure no underflow
    }
}
