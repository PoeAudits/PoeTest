// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {StdCheats, Test, console2 as console} from "lib/forge-std/src/Test.sol";
import "test/PoeUtils/PoeUtils.sol";
import "script/Deploy.sol";

contract Setup is Test, PoeUtils, DeploymentTemplate {
    ///@dev Anvil generated addresses
    address internal _alice = 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266;
    address internal _bob = 0x70997970C51812dc3A010C7d01b50e0d17dc79C8;
    address internal _carl = 0x3C44CdDdB6a900fa2b585dd299e03d12FA4293BC;
    address[] internal users;

    ///@dev Using standard amount to avoid tests breaking on decimal changes
    uint256 standardAmount;

    mapping(address => string) names;

    function setUp() public virtual override {
        vm.createSelectFork("http://127.0.0.1:8545");
        super.setUp();
        setupUsers();
        setupLabels();
        setupNames();
        standardAmount = 10 ** depositTokenDecimals;
        __PoeUtils_init();
    }

    ///@notice Setup contract labels
    function setupLabels() private {
        vm.label(_depositToken, "Deposit Token");
        vm.label(_target, "Implementation");
        vm.label(_alice, "Alice");
        vm.label(_bob, "Bob");
        vm.label(_carl, "Carl");
    }

    ///@notice Setup names array
    ///@dev Useful for logging contract names during debugging
    function setupNames() private {
        names[_depositToken] = "Deposit Token";
        names[_target] = "Implementation";
        names[_alice] = "Alice";
        names[_bob] = "Bob";
        names[_carl] = "Carl";
    }

    ///@notice Setup users
    ///@dev Funding logic in parent contract
    function setupUsers() internal {
        users.push(_alice);
        users.push(_bob);
        users.push(_carl);

        super.setupUsers(users);
    }
}
