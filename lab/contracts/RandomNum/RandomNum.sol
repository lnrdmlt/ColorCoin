// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

/**
 * This contract creates a random value based on the previous block hash. 
 * DANGEROUS, WILL ONLY GENERATE 1 VALUE PER BLOCK.
 **/

contract RandomNum {

    function randomNum () public view returns (uint) {
        return uint(blockhash(block.number - 1));
    }

}