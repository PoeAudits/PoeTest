// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.4;

import {State} from "test/harness/Harness.sol";

interface IHarness {
    function GetState() external view returns (State memory self);

    function GetState(address user) external view returns (State memory self);
}
