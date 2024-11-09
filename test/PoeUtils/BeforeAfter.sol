// SPDX-License-Identifier: GPL-2.0
pragma solidity ^0.8.0;

// Delete State and add below after "make interface"
// import {State} from "test/harness/Harness.sol";

import {State} from "test/harness/Harness.sol";

abstract contract BeforeAfter {
    State internal _before;
    State internal _after;

    function __before(address user) internal virtual {}

    function __before() internal virtual {}

    function __after(address user) internal virtual {}

    function __after() internal virtual {}
}
