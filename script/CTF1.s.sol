// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "forge-std/console2.sol";
import "../src/CTF1.sol";
import "../src/HashedStringMap.sol";

contract CTF1 is Script {
    HashedStringMap private converter;
    CTF1 private targetContract;

    constructor() {
        converter = new HashedStringMap();
        string memory initialPassword = "0x68ffc335fd64ad387762ed58477f547ae0f06d4e49e65aabce8956718e1c0a45";
        bytes32 passwordHash = converter.stringToBytes32(initialPassword);
        targetContract = new CTF1(passwordHash);
    }

    function retrieveData(uint256 dataSlot) internal view returns (bytes32) {
        bytes32 dataValue = targetContract.getData(dataSlot);
        return dataValue;
    }

    function processAndLog(string memory data) internal {
        console2.log("Processed Data:");
        console2.log(data);
    }

    function run() public {
        uint256 privateDataSlot = 1;

        bytes32 privateData = retrieveData(privateDataSlot);

        string memory processedData = converter.bytes32ToString(privateData);

        processAndLog(processedData);
    }
}
