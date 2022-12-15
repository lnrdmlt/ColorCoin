// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/utils/Strings.sol";
import "@openzeppelin/contracts/utils/Base64.sol";
import "./RandomNumConsumer.sol";

contract ColorCoin is ERC721, Ownable, RandomNumConsumer{
    using Counters for Counters.Counter;

    Counters.Counter private _tokenIdCounter;
    mapping(uint256 => uint256) public huesById;

    /**
     * Mints 100 NFTs, a list of recipients will recieve the first NFTs, and the rest will go to the creator's wallet.
     **/
    constructor(address[] memory recipients, address randomNumberAddr, uint256 totalSupply) ERC721("ColorCoin", "CLC") {
        // set up RandomNumConsumer 
        setRandomNum(randomNumberAddr);

        // mints _ nfts to different recipients
        for (uint256 i = 0; i < totalSupply ; i++) {
            if (i < recipients.length) {
                safeMint(recipients[i]);
            } else {
                safeMint(msg.sender);
            }
        }
    }

    /**
     * Mints a token with an incremented ID.
     **/
    function safeMint(address to) public onlyOwner {
        uint256 tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        _safeMint(to, tokenId);
         
    }

    /**
     * Generawes a svg, using a data URI in order to provide a thumbnail to the image generated for the NFT.
     **/
    function generateImage(
        uint256 hue,
        uint256 saturation,
        uint256 lightness
    ) public pure returns (string memory) {
        bytes memory svg = abi.encodePacked(
            '<svg width="200" height="300" xmlns="http://www.w3.org/2000/svg">',
            '<rect width="200" height="300" x="0" y="0" fill="',
            "hsl(",
            Strings.toString(hue),
            ", ",
            Strings.toString(saturation),
            "%, ",
            Strings.toString(lightness),
            "%",
            ")",
            '" />',
            "</svg>"
        );

        return
            string(
                abi.encodePacked(
                    "data:image/svg+xml;base64,",
                    Base64.encode(svg)
                )
            );
    }

    /**
     * Employs json file delievered by a data URI in order to create the neccesary information about the NFT.
     **/
    function generateMetadata(uint256 nameNum)
        public
        pure
        returns (string memory)
    {
        bytes memory json = abi.encodePacked(
            "{",
            '"name": "ColorCoin #',
            Strings.toString(nameNum),
            '",\n',
            '"description": "Unique NFTs with color-changing system with every trade. ",\n',
            '"image": "',
            generateImage(6, 6, 6),
            '"\n '
            "}"
        );

        return
            string(
                abi.encodePacked(
                    "data:application/json;base64,",
                    Base64.encode(json)
                )
            );
    }

    function tokenURI(uint256 tokenId)
        public
        pure
        override
        returns (string memory)
    {
        uint256 nameNum = tokenId + 1;
        return generateMetadata(nameNum);
    }
    function _afterTokenTransfer(address from,address to,uint256 firstTokenId,uint256 batchSize) internal virtual override {
        huesById[firstTokenId] += 10;
    }
}
