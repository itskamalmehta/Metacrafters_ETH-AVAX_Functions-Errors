# Metacrafters_ETH-AVAX_Functions-Errors

This project is a smart contract that implements the require(), assert() and revert() statements.

## Description

This repository contains a Solidity smart contract that demonstrates the usage of require, assert() and revert() statements, with the help of APECoin and its functions like minting, burning, owner, balance etc.

## Getting Started

### Installing

To interact with the smart contract, you can use Remix, an online Solidity IDE. Follow these steps:

1. Go to the Remix website.

2. Create a new file and save it with a .sol extension (e.g., FunctionsAndErrors.sol).

3. Copy and paste the provided Solidity code into the file.

4. Click on the "Solidity Compiler" tab and set the compiler version to 0.8.18 (or another compatible version). Click on "Compile FunctionsAndErrors.sol" to compile the code.

5. Deploy the contract by clicking on the "Deploy & Run Transactions" tab. Select the "FunctionsAndErrors" contract from the dropdown menu and click "Deploy."

6. Once the contract is deployed, you can interact with it using the provided functions:

   (a) Use the deposit function to deposit funds into the contract.
   (b) Use the withdraw function to withdraw a specified amount from the contract.
   (c) Use the checkBalance function to view the contract's current balance.

### Program Code:

```
// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract ABCoin {
    string public name = "ABCoin"; // The name of the coin
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
    function burn(address target, uint amount) public onlyOwner {
        require(balances[target] >= amount, "Insufficient balance to burn");

        balances[target] -= amount; // Decrease target's balance
        assert(balances[target] >= 0); // Ensure no underflow
    }
}
```


## Authors

Kamal Mehta
itskamalmehta@gmail.com


## License

This project is licensed under the [NAME HERE] License - see the LICENSE.md file for details
