# Metacrafters_ETH-AVAX_Functions-Errors

This project is a smart contract that implements the require(), assert() and revert() statements.

## Description

This repository contains a Solidity smart contract that demonstrates the usage of require, assert() and revert() statements, with the help of APECoin and its functions like minting, burning, owner, balance etc.

## Getting Started

### Installing

To Run this Smart Contract use Online Remix IDE.
Follow these steps:

1. Go to the Remix website, https://remix.ethereum.org/ .

2. Create New file and Save it with a .sol extension with any name before it.

3. Copy-paste the provided Solidity code into the file created by you.

4. Click on the "Solidity Compiler" tab and set the compiler version to 0.8.18 (or another compatible version) then Click on "Compile" to compile.

5. Deploy the contract by clicking on the "Deploy & Run Transactions" tab then and choose Environment "Remix VM (Paris)", click "Deploy."

6. Once the contract is deployed, you can interact with it using the provided functions:
    
   (a) Copy address from either clicking on "copy address" from Account option or click on owner and copy address.  
   (a) Use the mint and burn function to mint and burn token.
   (b) Use the Name_Coin function to view the name of coin.
   (c) Use the Balance function to view the current balance.

### Program Code:

```
// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract APECoin {
    string public name = "APECoin"; // The name of the coin
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
        assert(balance[target] <= type(uint).max); // Ensure no overflow
    }

    // Fallback function to revert
    fallback() external {
        revert("Fallback function");
    }
}

```


## Authors

Kamal Mehta

itskamalmehta@gmail.com


## License

This project is licensed under the [NAME HERE] License - see the LICENSE.md file for details
