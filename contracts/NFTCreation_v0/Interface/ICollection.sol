interface ICollection {
    function singlepermit(
        address holder, 
        address spender, 
        uint256 nonce, 
        uint256 expiry, 
        uint _tokenId,
        bool allowed, 
        uint8 v, 
        bytes32 r, 
        bytes32 s) external;


    function allpermit(
        address holder, 
        address spender, 
        uint256 nonce, 
        uint256 expiry,
        bool approved, 
        uint8 v, 
        bytes32 r, 
        bytes32 s) external;

    function mint(address to) external;
    function batchmint(address to, uint amount) external;
    function changeBaseURI(string memory baseURI_) external;
    function changetokenURI(uint256 tokenId, string memory tokenURI) external;

}