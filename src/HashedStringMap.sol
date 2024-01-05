//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HashedStringMap {
    mapping(uint256 => string) private dataStore;

    function storeString(string memory s) public returns (uint256) {
        uint256 hash = uint256(keccak256(abi.encodePacked(s)));
        dataStore[hash] = s;
        return hash;
    }

    function retrieveString(uint256 hash) public view returns (string memory) {
        return dataStore[hash];
    }
}
