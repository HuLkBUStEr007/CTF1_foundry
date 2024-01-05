// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UniqueStringAddress {
    function convertStringToAddress(string memory input) public pure returns (address) {
        require(bytes(input).length == 42, "Invalid address length");
        return address(uint160(uint256(keccak256(abi.encodePacked(input)))));
    }

    function convertAddressToString(address _addr) public pure returns (string memory) {
        uint256 addr = uint256(uint160(_addr));
        bytes memory buffer = new bytes(40);

        for (uint256 i = 0; i < 20; i++) {
            buffer[i * 2] = bytes1(uint8((addr / (2 ** (8 * (19 - i)))) & 0xFF));
            buffer[i * 2 + 1] = bytes1(uint8(((addr / (2 ** (8 * (19 - i)))) >> 4) & 0xFF));
        }

        return string(buffer);
    }
}
