// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

/**
 * This contract mints 100 NFTs, a list of recipients will recieve the first NFTs, and the rest will go to the creator's wallet.
 **/
contract ColorCoin is ERC721, Ownable {
    using Counters for Counters.Counter;

    Counters.Counter private _tokenIdCounter;

    constructor(address[] memory recipients) ERC721("ColorCoin", "CLC") {
        for (uint256 i = 0; i < 100; i++) {
            if (i < recipients.length) {
                safeMint(recipients[i]);
            } else {
                safeMint(msg.sender);
            }
        }
    }

    function safeMint(address to) public onlyOwner {
        uint256 tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        _safeMint(to, tokenId);
    }
}
