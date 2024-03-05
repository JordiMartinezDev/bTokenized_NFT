//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Test} from "../lib/forge-std/src/Test.sol";
import {DeployBasicNFT} from "../script/DeployBasicNFT.s.sol";
import {BasicNFT} from "../src/BasicNFT.sol";

contract BasicNFTTests is Test{

    DeployBasicNFT public deployer;
    BasicNFT public basicNft;
    address public USER = makeAddr("user");

    string public constant testURI = "https://bafybeiar6p52sbxvkcv5zne4pqmepjuv5xuwmdwu5o42pezb2jv5pxhlmu.ipfs.nftstorage.link/";

    function setUp() public {

        deployer = new DeployBasicNFT();
        basicNft = deployer.run();
        
    }

    function testNameIsCorrect() public view{
       string memory expectedName = "myNFT";
       string memory actualName = basicNft.name();
       assert(keccak256(abi.encodePacked(expectedName)) == keccak256(abi.encodePacked(actualName)));
    }
    
    function testTokenMinting() public {
        vm.prank(USER);


        basicNft.mintNft(testURI);
        assert(basicNft.balanceOf(USER) >= 1);

        assert(keccak256(abi.encodePacked(testURI)) == keccak256(abi.encodePacked(basicNft.tokenURI(0))));
    }
}
