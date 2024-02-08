//SPDX-License-Identifier: MIT


pragma solidity ^0.8.18;

import {ERC721} from "@openzeppelin/contracts/ERC721/ERC721.sol";

contract BasicNFT is ERC721{

    uint256 private s_TokenId;

    constructor() ERC721("TestNFT","TNFT"){
        s_TokenId = 0;
    }

}