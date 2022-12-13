// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./IRandomNum.sol";

contract UnsafeRandomNum is IRandomNum{

    function randomNum () public view returns (uint) {
            return uint(blockhash(block.number - 1));
    }

}