//SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.4;

import {Script, console2 as console} from "lib/forge-std/src/Script.sol";
import {CONTRACT_NAME_HERE} from "src/CONTRACT_NAME_HERE.sol";
import {Harness} from "test/harness/Harness.sol";
import {IHarness} from "test/harness/IHarness.sol";
import {IERC20} from "lib/openzeppelin-contracts/contracts/token/ERC20/IERC20.sol";

contract BaseDeploy is Script {
    CONTRACT_NAME_HERE internal contract_name_here;

    Harness internal harness;
    IHarness internal target;

    IERC20 internal depositToken;

    address internal _depositToken;
    address internal _target;

    uint256 internal depositTokenDecimals;

    function setUp() public virtual {
        _depositToken = 0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48;
        depositToken = IERC20(_depositToken);
    }

    function deploy() public returns (address) {
        contract_name_here = new CONTRACT_NAME_HERE();
        _target = address(contract_name_here);
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
