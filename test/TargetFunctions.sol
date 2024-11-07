// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "./Setup.sol";

contract TargetFunctions is Setup {
    function setUp() public virtual override {
        super.setUp();
    }

    function __before(address user) internal virtual override {
        _before = target.GetState(user);
    }

    function __after(address user) internal virtual override {
        _after = target.GetState(user);
    }

    function __before() internal virtual override {
        _before = target.GetState();
    }

    function __after() internal virtual override {
        _after = target.GetState();
    }

    function SelectUser() internal returns (address) {
        uint256 index = UseRandom() % users.length;
        return users[index];
    }
}
