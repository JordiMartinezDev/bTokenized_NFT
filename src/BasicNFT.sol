//SPDX-License-Identifier: MIT


pragma solidity ^0.8.18;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

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


    function stake(uint256 amount, address token) public returns (bool){

        s_balances[msg.sender][token] += amount;
        bool success = IERC20(token).transferFrom(msg.sender, address(this), amount);
        if(!success) revert BasicNFT__TransferFailed();
        return success;
    }

}