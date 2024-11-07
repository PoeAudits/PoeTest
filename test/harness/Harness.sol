//SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

import "src/CONTRACT_NAME_HERE.sol";

struct State {
    uint256 TBD;
}

contract Harness is CONTRACT_NAME_HERE {
    constructor() CONTRACT_NAME_HERE() {}

    function GetState() external view returns (State memory self) {}

    function GetState(address user) external view returns (State memory self) {}
}
