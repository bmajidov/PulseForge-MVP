// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

library LibDiamond {
    bytes32 constant DIAMOND_STORAGE_POSITION = keccak256("diamond.standard.diamond.storage");

    struct DiamondStorage {
        mapping(bytes4 => address) facetAddresses;
    }

    function diamondStorage() internal pure returns (DiamondStorage storage ds) {
        bytes32 position = DIAMOND_STORAGE_POSITION;
        assembly {
            ds.slot := position
        }
    }

    function setFunctionAddress(bytes4 _functionSelector, address _facetAddress) internal {
        DiamondStorage storage ds = diamondStorage();
        ds.facetAddresses[_functionSelector] = _facetAddress;
    }
}
