// SPDX-License-Identifier: GPL-2.0
pragma solidity ^0.8.0;

import {console2 as console} from "lib/forge-std/src/Test.sol";

abstract contract Gas {
    event LogGas(string message, uint256 val);

    string private checkpointLabel;
    uint256 private checkpointGasLeft = 1; // Start the slot warm.

    function __Gas_init() internal {
        startMeasuringGas("Burn");
        stopMeasuringGas();
    }

    function startMeasuringGas(string memory label) internal virtual {
        checkpointLabel = label;

        checkpointGasLeft = gasleft();
    }

    function stopMeasuringGas() internal virtual {
        uint256 checkpointGasLeft2 = gasleft();

        // Subtract 100 to account for the warm SLOAD in startMeasuringGas.
        uint256 gasDelta = checkpointGasLeft - checkpointGasLeft2 - 100;

        emit LogGas(string(abi.encodePacked(checkpointLabel, " Gas")), gasDelta);
        console.log("Gas: ", gasDelta);
    }
}
