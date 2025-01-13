// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.28;

import { ERC721URIStorage, ERC721 } from "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

contract Foo is ERC721URIStorage {
    uint256 private _tokenIdCounter;

    constructor() ERC721("GameItem", "ITM") { }

    function awardItem(address player, string memory tokenURI) public returns (uint256) {
        uint256 newItemId = _tokenIdCounter;
        _safeMint(player, newItemId);
        _setTokenURI(newItemId, tokenURI);
        _tokenIdCounter++;
        return newItemId;
    }
}
