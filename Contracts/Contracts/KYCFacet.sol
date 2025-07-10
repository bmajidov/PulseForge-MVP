// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "./LibDiamond.sol";

contract KYCFacet {
    mapping(address => bool) public kycPassed;
    event KYCVerified(address indexed user);

    function simpleKYC() external {
        kycPassed[msg.sender] = true;
        emit KYCVerified(msg.sender);
    }
}
