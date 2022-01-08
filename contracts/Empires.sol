// SPDX-License-Identifier: MIT
/// @title Smart contract of the Empires Punk
/// @author Rafael Fuentes Rangel
pragma solidity ^0.8.2;
/// @dev herences included
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "./Base64.sol";
/// @dev adding herences from OpenZeppelin
contract EmpiresPunks is ERC721, ERC721Enumerable {
    /// @dev using libraries of Counters
    using Counters for Counters.Counter;
    Counters.Counter private _idCounter;
    /// @dev Maximun of TotalSupply of NFT checked in the constructor
    uint256 public maxSupply;
    /// @dev Constructor adding the name and token
    constructor(uint256 _maxSupply) ERC721("Empires Punks", "EM") {
        maxSupply = _maxSupply;
    }
    /// @dev The following functions are overrides required by Solidity.
    /// @dev Function mint added, that will add the tokenIsd with the msg.sender
    function mint() public {
        uint256 current = _idCounter.current();
        /// @dev checked thar current will be less than MaxSupply
        require(current < maxSupply);
        _safeMint(msg.sender, current);
    }

    function tokenURI(uint256 tokenId) public view override returns(string memory) {
        require(_exists(tokenId), "ERC721 Metadata: URI query for nonexistent token");
        /// @dev using Base64 where will go the images JSON
        string memory jsonURI = Base64.encode(
            abi.encodePacked(
                '{ "name": "EmpiresPunks #',
                tokenId,
                '", "description": "Empires Punks are the NFT will use in the Metaverse of Empires around the world, developed by ADVANCE BLOCKCHAIN RESEARCH", "image": "',
                "// TODO: Calculate image URL",
                "ADVANCE BLOCKCHAIN RESEARCH - EMPIRES-METAVERSE",
                '"}'
            )
        );
        /// @dev result of the concatenation of data 
        return string(abi.encodePacked("data:application/json;base64,", jsonURI));
    }

    function _beforeTokenTransfer(address from, address to, uint256 tokenId)
        internal
        override(ERC721, ERC721Enumerable)
    {
        super._beforeTokenTransfer(from, to, tokenId);
    }
    /// @dev anounce!! 🚨
    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721, ERC721Enumerable)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }

}