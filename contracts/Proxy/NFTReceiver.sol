// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../../node_modules/@openzeppelin/contracts/token/ERC721/utils/ERC721Holder.sol";
import "../../node_modules/@openzeppelin/contracts/token/ERC721/IERC721.sol";

contract NFTReceiver is ERC721Holder {
    

    function receiveone(address nftaddress, uint tokenId) public {
        IERC721(nftaddress).transferFrom(address(this), msg.sender, tokenId);
    }




}