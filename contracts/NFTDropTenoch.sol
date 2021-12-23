// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title Drop of NFT uploading to Polygon
contract TenochNFT {
    /// @dev Adding´ address
    address public owner; 

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
    mapping (uint256 => address) public users;

    constructor() {
        owner = msg.sender; /// @dev declaring the owner is now equal to msg.sender
    }

    modifier onlyOwner () {
        require(msg.sender == owner, "You are not the owner");
        _;
    }

    /// @dev Get the NFT drop objects list
    function getDrop() public view returns(Drop[] memory) {
        return drops;
    }

    /// @dev Add to the NFT drop objects list
    function addDrop(
    Drop memory _drop
    ) public {
        _drop.approved = false;
        drops.push(_drop);
        uint256 id = drops.length - 1;
        users[id] = msg.sender;
    }

    /// @dev update the drop into the smart contract
    function updateDrop(
        uint256 _index, Drop memory _drop
    ) public {
        require(msg.sender == users[_index], "You are not owner of this drop");
        _drop.approved = false;
        drops[_index] = _drop;
    }

    /// @dev Remove from the NFT drop objects list


    /// @dev Approve an NFT drop object to enable displaying
    function approveDrop(uint256 _index) public onlyOwner {
        Drop storage drop = drops[_index];
        drop.approved = true;
    }

    /// @dev Clear out all NFT drop objects from list


}