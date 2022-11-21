// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract RandomNum {

    function randomNum () public view returns (uint) {
        return uint(blockhash(block.number - 1));
    }

}