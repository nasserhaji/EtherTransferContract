# EtherTransferContract

A Solidity smart contract for the transfer of Ethereum with various conditions.

## Contract Details

- Solidity Version: 0.7.0
- License: MIT

## Contract Conditions

1. The contract is for the transfer of a certain number of Ethereum with a minimum of 0.001 Ether and a maximum of 10 Ether.
2. The contract has an ether payer and an ether receiver.
3. The payer and receiver must agree on the number of Ether for the transaction, and this agreement is done by paying a fee of 0.000001 Ether as fee #1 on both sides.
4. Ethers will not be transferred until both parties have agreed, and a signature in the contract for the agreement is obtained by deducting the cost of 0.000001 Ether as fee #2.
5. Fee No. 1 and Fee No. 2 are deposited into the account of the contract owner.
6. After the transaction is completed, the contract returns to its initial state and is ready for a new transaction.
7. The contract should be implemented in version 7 of Solidity.
8. Security measures have been implemented in the contract.
9. Special attention has been given to numbers and calculations.

* The contract owner is responsible for initiating the transfer and withdrawing the fees.
* The payer and receiver must call the `agreeTransfer` function, paying the fee of 0.000001 Ether each, to indicate their agreement.
* Once both parties have agreed, the contract transfers the agreed amount of Ether to the receiver and the fees to the contract owner.
* The contract also includes a `getContractBalance` function to check the contract's balance and a `withdrawFees` function for the contract owner to withdraw the accumulated fees.

### Initiate Transfer

To initiate a transfer, call the `initiateTransfer` function and send the desired amount of Ether as the value. The transfer amount must be within the specified range.

```solidity
function initiateTransfer() external payable
```
## Agree Transfer
Both the payer and receiver must agree on the transfer by calling the agreeTransfer function and paying the fee #1 (0.000001 Ether). The function checks the caller's role and ensures that each party can only agree once.
```solidity
function agreeTransfer() external payable
```
## Transfer Ether
If both the payer and receiver have agreed, the `transferEther` function is called internally to transfer the agreed amount of Ether to the receiver and the fees to the contract owner.

## Get Contract Balance
The `getContractBalance` function allows anyone to check the balance of the contract.

```solidity
function getContractBalance() public view returns (uint256)
```

## Withdraw Fees
The contract owner can withdraw the accumulated fees by calling the `withdrawFees` function.

```solidity
function withdrawFees() external onlyOwner
```
## Security Measures
The contract implements a modifier `onlyOwner` to restrict access to certain functions only to the contract owner.
Input validation is performed to ensure the transfer amount is within the specified range and the fee amounts are correct.
The contract checks for sufficient balance before transferring Ether or fees.
The contract utilizes the `payable` modifier for receiving Ether.

## Note
This contract assumes a trusted environment and does not implement sophisticated security measures such as access control or input sanitization. It is essential to thoroughly review and test the contract before deploying it to the Ethereum network.

## Deployment and Testing

To deploy and test the EtherTransferContract, follow these steps:

 Clone this repository:

```bash
git clone https://github.com/hajihashemabad/EtherTransferContract.git
```

1. Install [Truffle](https://www.trufflesuite.com/truffle) and set up a development environment.

2. Create a new Solidity file and copy the contract code.

3. Compile the contract using Truffle's compiler.

4. Configure the deployment network in the Truffle configuration file (`truffle-config.js` or `truffle.js`).

5. Deploy the contract to the desired network using the Truffle migration scripts.

6. Write test cases using a testing framework like [Truffle Test](https://www.trufflesuite.com/docs/truffle/testing/testing-your-contracts).

7. Run the test cases to verify the contract's functionality.

8. Make sure to test different scenarios, including edge cases and invalid inputs, to ensure the contract behaves as expected.

## License

This project is licensed under the [MIT License](LICENSE).

## Contributing
I welcome contributions to the EtherTransferContract project! If you'd like to contribute, please fork the repository and create a new branch for your changes. Once you've made your changes, submit a pull request and I'll review it as soon as possible.

Contributions are welcome! If you want to contribute to this project, follow these steps:

1. Fork this repository.
2. Create a new branch: `git checkout -b my-new-branch`.
3. Make your changes and commit them: `git commit -am 'Add some feature'`.
4. Push to the branch: `git push origin my-new-branch`.
5. Submit a pull request.

Please ensure that your code follows the repository's coding conventions and passes any existing tests.

## Authors
- [Abdelnasser Hajihashemabad](https://github.com/hajihashemabad)

## Contact
If you have any questions or comments about EtherTransferContract Smart Contract, feel free to reach out to me at [Email](mailto:info@abdelnasser.com).


