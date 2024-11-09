-include .env

.PHONY: forge script test anvil snapshot

interface:
	forge build && forge inspect CONTRACT_NAME_HERE abi > abi.json && cast interface abi.json -o src/interfaces/ICONTRACT_NAME_HERE.sol -n ICONTRACT_NAME_HERE && forge inspect Harness abi > abi.json && cast interface abi.json -o test/harness/IHarness.sol -n IHarness && script/Bash/modifyInterface.sh


