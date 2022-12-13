// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./IRandomNum.sol";

contract TestRandomNum is IRandomNum{

uint _num = 0;

    constructor(uint num) {
        _num = num;
    }

    function randomNum () public view returns (uint) {
            return _num;
    }

}