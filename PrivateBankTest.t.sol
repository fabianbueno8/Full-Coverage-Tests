
// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import "forge-std/Test.sol";
import "../src/PrivateBank.sol";

contract PrivateBankTest is Test {
    PrivateBank privateBank;

    function setUp() public {
        privateBank = new PrivateBank();
    }

    // Test deposit functionality
    function testDeposit() public {
        uint256 initialBalance = privateBank.getBalance();
        uint256 depositAmount = 1 ether;

        vm.deal(address(this), depositAmount); // Fund the test contract
        privateBank.deposit{value: depositAmount}();

        assertEq(privateBank.getBalance(), initialBalance + depositAmount);
        assertEq(privateBank.getUserBalance(address(this)), depositAmount);
    }

    // Test withdraw functionality
    function testWithdraw() public {
        uint256 depositAmount = 1 ether;

        vm.deal(address(this), depositAmount); // Fund the test contract
        privateBank.deposit{value: depositAmount}();

        uint256 initialBalance = address(this).balance;
        privateBank.withdraw();

        assertEq(address(this).balance, initialBalance + depositAmount);
        assertEq(privateBank.getUserBalance(address(this)), 0);
    }

    // Test withdraw failure with insufficient balance
    function testWithdrawFailsWithNoBalance() public {
        vm.expectRevert("Insufficient balance");
        privateBank.withdraw();
    }

    // Test contract balance retrieval
    function testGetBalance() public {
        uint256 depositAmount = 1 ether;
        vm.deal(address(this), depositAmount); // Fund the test contract
        privateBank.deposit{value: depositAmount}();

        assertEq(privateBank.getBalance(), depositAmount);
    }

    // Test user balance retrieval
    function testGetUserBalance() public {
        uint256 depositAmount = 1 ether;
        vm.deal(address(this), depositAmount); // Fund the test contract
        privateBank.deposit{value: depositAmount}();

        assertEq(privateBank.getUserBalance(address(this)), depositAmount);
    }
}
