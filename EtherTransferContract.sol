// SPDX-License-Identifier: MIT
pragma solidity ^0.7.0;

contract EtherTransferContract {
    address payable public payer;
    address payable public receiver;
    address payable public contractOwner;
    uint256 public agreedAmount;
    uint256 private constant minAmount = 0.001 ether;
    uint256 private constant maxAmount = 10 ether;
    uint256 private constant fee1 = 0.000001 ether;
    uint256 private constant fee2 = 0.000001 ether;
    bool private payerAgreed;
    bool private receiverAgreed;

    constructor() {
        contractOwner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == contractOwner, "Only contract owner can call this function");
        _;
    }

    function initiateTransfer() external payable {
        require(msg.value >= minAmount && msg.value <= maxAmount, "Invalid transfer amount");
        require(payer == address(0) && receiver == address(0), "Another transfer is already in progress");

        payer = msg.sender;
        agreedAmount = msg.value - fee1;
    }

    function agreeTransfer() external payable {
        require(msg.value == fee1, "Invalid fee amount");
        require(payer == msg.sender || receiver == msg.sender, "Unauthorized caller");

        if (payer == msg.sender) {
            require(!payerAgreed, "Payer already agreed");
            payerAgreed = true;
        } else {
            require(!receiverAgreed, "Receiver already agreed");
            receiverAgreed = true;
        }

        if (payerAgreed && receiverAgreed) {
            transferEther();
        }
    }

    function transferEther() private {
        require(address(this).balance >= agreedAmount + fee2, "Insufficient contract balance");

        receiver = msg.sender;
        payer.transfer(agreedAmount);
        contractOwner.transfer(fee1 + fee2);

        // Reset contract state
        payer = address(0);
        receiver = address(0);
        agreedAmount = 0;
        payerAgreed = false;
        receiverAgreed = false;
    }

    function getContractBalance() public view returns (uint256) {
        return address(this).balance;
    }

    function withdrawFees() external onlyOwner {
        require(address(this).balance >= fee1 + fee2, "Insufficient contract balance");

        contractOwner.transfer(fee1 + fee2);
    }
}
