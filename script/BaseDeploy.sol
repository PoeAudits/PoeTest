//SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.4;

import {Script, console2 as console} from "lib/forge-std/src/Script.sol";

import {CONTRACT_NAME_HERE} from "src/CONTRACT_NAME_HERE.sol";
import {Harness} from "test/harness/Harness.sol";
import {IHarness} from "test/harness/IHarness.sol";

contract BaseDeploy is Script {
    ///@dev Replace CONTRACT_NAME_HERE with the contract name
    CONTRACT_NAME_HERE internal implementation;

    Harness internal harness;
    IHarness internal target;

    address internal _target;

    address internal _alice;
    address internal _bob;
    address internal _carl;
    address[] internal users;

    function setUp() public virtual {
        ///@dev First three Anvil generated addresses
        _alice = 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266;
        _bob = 0x70997970C51812dc3A010C7d01b50e0d17dc79C8;
        _carl = 0x3C44CdDdB6a900fa2b585dd299e03d12FA4293BC;
    }

    function deploy() public returns (address) {
        implementation = new CONTRACT_NAME_HERE();

        _target = address(implementation);
        target = IHarness(_target);
        return _target;
    }

    function deployHarness() public returns (address) {
        harness = new Harness();
        _target = address(harness);
        target = IHarness(_target);
        return _target;
    }
}
