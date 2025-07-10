// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "./LibDiamond.sol";

contract LaunchFacet {
    uint public projectCount;
    struct Project {
        address owner;
        uint16 riskScore;
    }
    mapping(uint => Project) public projects;
    event ProjectLaunched(uint indexed id, address owner);

    function simpleLaunch() external {
        projects[projectCount] = Project(msg.sender, 250);
        emit ProjectLaunched(projectCount, msg.sender);
        projectCount++;
    }
}
