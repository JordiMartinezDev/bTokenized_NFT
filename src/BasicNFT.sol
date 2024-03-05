//SPDX-License-Identifier: MIT


pragma solidity ^0.8.18;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract BasicNFT is ERC721{

    uint256 private s_tokenId;
    uint256 private s_tokenCounter;

    mapping(uint256 => string) private s_tokenIdToUri;
    mapping(address=> mapping(address => uint256)) public s_balances;

    error BasicNFT__TransferFailed();

    // This will be the template to create eacth NFT inside a collection NFT
    constructor(string memory _name, string memory _symbol) ERC721(_name, _symbol){
        s_tokenCounter = 0;
    }

    function mintNft(string memory tokenUri) public{
        s_tokenIdToUri[s_tokenCounter] = tokenUri;
        _safeMint(msg.sender, s_tokenCounter);
    }

    function tokenURI(uint256 tokenId)public view override returns (string memory){
        return s_tokenIdToUri[tokenId];
    }

}