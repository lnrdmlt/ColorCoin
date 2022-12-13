// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./IRandomNum.sol";

contract RandomNumConsumer{

    address _addr;

    function setRandomNum (address addr) public {
        _addr = addr;
    }

    function randomNum () public view virtual returns (uint) {
        IRandomNum randomNumContract = IRandomNum(_addr);
        return randomNumContract.randomNum();
    }

}