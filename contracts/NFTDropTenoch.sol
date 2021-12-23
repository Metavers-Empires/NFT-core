// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title Drop of NFT uploading to Polygon
contract TenochNFT {

    /// @dev Define an NFT drop object with an struct.
    struct Drop {
        string imageURI;
        string name;
        string description;
        string twitter;
        string instagram;
        string websiteURI;
        string price;
        uint256 supply;
        uint256 presale;
        uint256 sale;
        uint8 chain;
        bool approved;
    }

    /// @dev Create a list of some sort to hold all the objects
    Drop[] public drops;
    mapping (uint256 => address) public user;

    /// @dev Get the NFT drop objects list
    function getDrop() public view returns(Drop[] memory) {
        return drops;
    }

    /// @dev Add to the NFT drop objects list
    function addDrop(
    string memory _imageURI,
    string memory _name,
    string memory _description,
    string memory _twitter,
    string memory _instagram,
    string memory _websiteURI,
    string memory _price,
    uint256 _supply,
    uint256 _presale,
    uint256 _sale,
    uint8 _chain
    ) public {
    drops.push(Drop(
        _imageURI,
        _name,
        _description,
        _twitter,
        _instagram,
        _websiteURI,
        _price,
        _supply,
        _presale,
        _sale,
        _chain,
        false
        ));
        uint256 id = drops.length - 1;
    }

    /// @dev update the drop into the smart contract
    function updateDrop(
        uint256 _index,
        string memory _imageURI,
        string memory _name,
        string memory _description,
        string memory _twitter,
        string memory _instagram,
        string memory _websiteURI,
        string memory _price,
        uint256 _supply,
        uint256 _presale,
        uint256 _sale,
        uint8 _chain
    ) public {
        drops[_index] = Drop(
            _imageURI,
            _name,
            _description,
            _twitter,
            _instagram,
            _websiteURI,
            _price,
            _supply,
            _presale,
            _sale,
            _chain,
            false
        );
    }

    /// @dev Remove from the NFT drop objects list


    /// @dev Approve an NFT drop object to enable displaying
    function approveDrop(uint256 _index) public view {
        Drop storage drop = drops[_index];
        drop.approved = true;
    }

    /// @dev Clear out all NFT drop objects from list


}