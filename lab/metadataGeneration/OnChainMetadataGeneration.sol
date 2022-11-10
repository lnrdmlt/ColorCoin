// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "@openzeppelin/contracts/utils/Strings.sol"; 
import "@openzeppelin/contracts/utils/Base64.sol";

contract OnChainMetadataGeneration{
    function generateMetadata (uint nameNum) public pure returns (string memory) {
        bytes memory json = abi.encodePacked(
            '{',
            '"name": "ColorCoin #',
            Strings.toString(nameNum),
            '",\n',
            '"description": "Unique NFTs with color-changing system with every trade. ",\n', 
            '"image": "___"\n '
            '}'

        );

        return string (
            abi.encodePacked(
                'data:application/json;base64,', 
                Base64.encode(json)
            )
        );
    }
}