// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "./LibDiamond.sol";

contract PulseForgeDiamond {
    event DiamondCut(bytes4[] functionSelectors, address[] facetAddresses);

    constructor() {}

    function diamondCut(bytes4[] calldata _functionSelectors, address[] calldata _facetAddresses) external {
        require(_functionSelectors.length == _facetAddresses.length, "Invalid input");
        for (uint i = 0; i < _functionSelectors.length; i++) {
            LibDiamond.setFunctionAddress(_functionSelectors[i], _facetAddresses[i]);
        }
        emit DiamondCut(_functionSelectors, _facetAddresses);
    }

    fallback() external payable {
        LibDiamond.DiamondStorage storage ds = LibDiamond.diamondStorage();
        address facet = ds.facetAddresses[msg.sig];
        require(facet != address(0), "Function does not exist");
        assembly {
            calldatacopy(0, 0, calldatasize())
            let result := delegatecall(gas(), facet, 0, calldatasize(), 0, 0)
            returndatacopy(0, 0, returndatasize())
            switch result
            case 0 { revert(0, returndatasize()) }
            default { return(0, returndatasize()) }
        }
    }
}
