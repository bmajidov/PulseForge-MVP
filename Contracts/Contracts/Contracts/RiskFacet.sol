// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "./LibDiamond.sol";

contract RiskFacet {
    mapping(address => uint16) public riskScore;
    event RiskScoreUpdated(address indexed token, uint16 score);

    function getDummyRiskScore(address token) external returns(uint16) {
        riskScore[token] = 250; // 25% risk
        emit RiskScoreUpdated(token, 250);
        return 250;
    }
}
