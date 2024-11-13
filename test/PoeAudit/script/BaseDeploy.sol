//SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.4;

import {Script, console2 as console} from "lib/forge-std/src/Script.sol";

import {CONTRACT_NAME_HERE} from "src/CONTRACT_NAME_HERE.sol";
import {Harness} from "test/PoeAudit/harness/Harness.sol";
import {IHarness} from "test/PoeAudit/harness/IHarness.sol";

contract BaseDeploy is Script {
    ///@dev Replace CONTRACT_NAME_HERE with the contract name
    CONTRACT_NAME_HERE internal implementation;

    Harness internal harness;
    IHarness internal target;

    address internal _target;

    address internal _admin;
    address internal _alice;
    address internal _bob;
    address internal _carl;
    address[] internal users;

    ///@dev Using standard amount to avoid tests breaking on decimal changes
    uint256 standardAmount;

    function setUp() public virtual {
        ///@dev First three Anvil generated addresses
        _alice = 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266;
        _bob = 0x70997970C51812dc3A010C7d01b50e0d17dc79C8;
        _carl = 0x3C44CdDdB6a900fa2b585dd299e03d12FA4293BC;

        ///@dev 10th Anvil generated addresses
        _admin = 0xa0Ee7A142d267C1f36714E4a8F75612F20a79720;

        ///@dev Using standard amount to avoid tests breaking on decimal changes
        standardAmount = 10 ** 18;
    }

    function deployHarness() public returns (address) {
        harness = new Harness();
        _target = address(harness);
        target = IHarness(_target);
        return _target;
    }

    // Fund users with deposit tokens if needed
    function fundUsers(address[] memory _users) internal {}
}
