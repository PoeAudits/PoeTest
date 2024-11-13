// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.4;
import {HarnessState} from "test/PoeAudit/harness/Harness.sol";

interface IHarness {
    function GetState() external view returns (HarnessState memory self);

    function GetState(
        address user
    ) external view returns (HarnessState memory self);
}
