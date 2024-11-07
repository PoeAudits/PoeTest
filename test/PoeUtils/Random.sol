// SPDX-License-Identifier: GPL-2.0
pragma solidity ^0.8.0;

import {console2 as console} from "lib/forge-std/src/Test.sol";
import {vm} from "test/PoeUtils/Recon/IHevm.sol";

abstract contract Random {
    uint256 random;

    function NewRandom() internal {
        random = uint256(keccak256(abi.encode(random)));
    }

    function UseRandom() internal returns (uint256 val) {
        val = random;
        NewRandom();
    }

    function RandomRollForward() internal returns (uint256 forwardBlocks) {
        forwardBlocks = (random % 15);
        console.log("Blocks Forward: ", forwardBlocks);
        vm.roll(block.number + forwardBlocks);
        vm.warp(block.timestamp + (6 * forwardBlocks));
        console.log("Block Number: ", block.number);
        console.log("");
        NewRandom();
    }

    function RandomBoundValue(
        uint256 min,
        uint256 max
    ) internal returns (uint256 value) {
        require(max >= min, "Max is less than Min");
        value = (random % (max - min)) + min;
        console.log("Random Value: ", value);
        NewRandom();
    }
}
