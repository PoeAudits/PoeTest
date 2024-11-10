//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "src/CONTRACT_NAME_HERE.sol";

struct HarnessState {
    uint256 TBD;
}

contract Harness is CONTRACT_NAME_HERE {
    constructor() {}

    function GetState() external view returns (HarnessState memory self) {}

    function GetState(
        address user
    ) external view returns (HarnessState memory self) {}
}
