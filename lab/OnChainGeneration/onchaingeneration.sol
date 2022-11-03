// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;
import "@openzeppelin/contracts/utils/Strings.sol"; 
import "@openzeppelin/contracts/utils/Base64.sol";


contract onChainGeneration{
    function generateImage (uint hue, uint saturation, uint lightness) public pure returns (string memory) {
        bytes memory svg = abi.encodePacked(
            '<svg width="200" height="300" xmlns="http://www.w3.org/2000/svg"> <rect width="200" height="300" x="0" y="0" fill="hsl(',
            Strings.toString(hue),
            ', ',
            Strings.toString(saturation),
            '%, ' ,
            Strings.toString(lightness),
            '%)" /> </svg>'
        );
        return string (abi.encodePacked('data:image/svg+xml;base64,', Base64.encode(svg)));
    }
}