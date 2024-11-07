// SPDX-License-Identifier: UNLICENSED

pragma solidity 0.8.20;

import "../BaseDeploy.sol";

contract DeploymentTemplate is BaseDeploy {
    address internal _admin = 0xa0Ee7A142d267C1f36714E4a8F75612F20a79720;

    address internal _depositTokenWhale;

    function setUp() public virtual override {
        super.setUp();
        super.deployHarness();
    }

    // Add any user specific setup here
    function setupUsers(address[] memory users) public {
        // fundUsers(users);
    }

    // Fund users with deposit tokens
    function fundUsers(address[] memory users) public {
        _depositTokenWhale = 0x0000000000000000000000000000000000000000;

        (bool success, bytes memory data) = _depositToken.call(
            abi.encodeWithSignature("decimals()")
        );
        require(success, "Failed Decimals Call");
        depositTokenDecimals = abi.decode(data, (uint256));

        for (uint256 i; i < users.length; ++i) {
            vm.prank(_depositTokenWhale);
            depositToken.transfer(users[i], 1000 * 10 ** depositTokenDecimals);
        }
    }
}
