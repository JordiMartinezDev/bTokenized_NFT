//SPDX-License-Identifier: MIT


pragma solidity ^0.8.18;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract BasicNFT is ERC721{

    uint256 private s_TokenId;
    mapping(address=> mapping(address => uint256)) public s_balances;

    error BasicNFT__TransferFailed();

    // This will be the template to create eacth NFT inside a collection NFT
    constructor() ERC721("TestNFT","TNFT"){
        s_TokenId = 0;
    }

    function mintNft() public{

    }

}