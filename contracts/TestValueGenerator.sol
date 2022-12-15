// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./ColorCoin.sol";

contract TestValueGenerator is ColorCoin{
    address[] testRecipients;
    constructor() ColorCoin(testRecipients, address(0), 5) {

    }

    function randomNum() public override view returns(uint256) {
        return block.timestamp;
    }
}