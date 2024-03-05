//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Test} from "../lib/forge-std/src/Test.sol";
import {DeployBasicNFT} from "../script/DeployBasicNFT.s.sol";
import {BasicNFT} from "../src/BasicNFT.sol";

contract BasicNFTTests is Test{

    DeployBasicNFT public deployer;
    BasicNFT public basicNft;

    function setUp() public {

        deployer = new DeployBasicNFT();
        basicNft = deployer.run();
        
    }

    function testNameIsCorrect() public view{
       string memory expectedName = "myNFT";
       string memory actualName = basicNft.name();
       assert(keccak256(abi.encodePacked(expectedName)) == keccak256(abi.encodePacked(actualName)));
    }
    

}
