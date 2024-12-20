// SPDX-License-Identifier: GPL-2.0
pragma solidity ^0.8.0;

import {console2 as console} from "lib/forge-std/src/Test.sol";

contract Log {
    uint256 public stringLength = 40;
    bool public ENABLED = true;

    function setEnable(bool _enable) internal {
        ENABLED = _enable;
    }

    modifier EnableLogs(bool _enable) {
        if (ENABLED) {
            _;
        }
    }

    function logBreak() internal pure {
        console.log("");
    }

    function printBreak() internal view EnableLogs(ENABLED) {
        console.log("- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -");
        console.log("");
    }

    function fixedLength(string memory s) internal view returns (string memory) {
        bytes memory b = abi.encodePacked(s);
        if (b.length > stringLength) {
            return s;
        }
        uint256 spacesNeeded = stringLength - b.length;

        if (spacesNeeded > 0) {
            // Only add spaces if necessary
            bytes memory spaces = new bytes(spacesNeeded);
            for (uint256 i = 0; i < spacesNeeded; i++) {
                spaces[i] = " "; // Fill the spaces byte array with spaces
            }
            bytes memory resultBytes = abi.encodePacked(b, spaces);

            return string(resultBytes);
        } else {
            return s;
        }
    }

    /*//////////////////////////////////////////////////////////////
                        Outside Methods
    //////////////////////////////////////////////////////////////*/
    /// @dev From Solmate
    function toString(uint256 value) internal pure returns (string memory str) {
        /// @solidity memory-safe-assembly
        assembly {
            // The maximum value of a uint256 contains 78 digits (1 byte per digit), but we allocate 160 bytes
            // to keep the free memory pointer word aligned. We'll need 1 word for the length, 1 word for the
            // trailing zeros padding, and 3 other words for a max of 78 digits. In total: 5 * 32 = 160 bytes.
            let newFreeMemoryPointer := add(mload(0x40), 160)

            // Update the free memory pointer to avoid overriding our string.
            mstore(0x40, newFreeMemoryPointer)

            // Assign str to the end of the zone of newly allocated memory.
            str := sub(newFreeMemoryPointer, 32)

            // Clean the last word of memory it may not be overwritten.
            mstore(str, 0)

            // Cache the end of the memory to calculate the length later.
            let end := str

            // We write the string from rightmost digit to leftmost digit.
            // The following is essentially a do-while loop that also handles the zero case.
            // prettier-ignore
            for { let temp := value } 1 {} {
                // Move the pointer 1 byte to the left.
                str := sub(str, 1)

                // Write the character to the pointer.
                // The ASCII index of the '0' character is 48.
                mstore8(str, add(48, mod(temp, 10)))

                // Keep dividing temp until zero.
                temp := div(temp, 10)

                // prettier-ignore
                if iszero(temp) { break }
            }

            // Compute and cache the final total length of the string.
            let length := sub(end, str)

            // Move the pointer 32 bytes leftwards to make room for the length.
            str := sub(str, 32)

            // Store the string's length at the start of memory allocated for our string.
            mstore(str, length)
        }
    }

    /**
     * @dev Returns true if the two strings are equal. Credit @OpenZeppelin
     */
    function equal(string memory a, string memory b) internal pure returns (bool) {
        return bytes(a).length == bytes(b).length && keccak256(bytes(a)) == keccak256(bytes(b));
    }
}
