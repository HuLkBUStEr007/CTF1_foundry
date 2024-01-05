// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "forge-std/console2.sol";

contract AccessPrivateData is Script {
    function getPrivateData(
        uint256 slotNo,
        address targetContract
    ) public view returns (bytes32) {
        bytes32 slotVal = vm.load(targetContract, bytes32(slotNo));
        return slotVal;
    }

    function run() public view {
        uint256 privateStateSlot = 1;
        address contractAddress = 0x89d5b48f3974A05b4BF816aebA12D401c0ebb003;

        bytes32 privateData = getPrivateData(privateStateSlot, contractAddress);

        console2.logBytes32(privateData);
    }
}