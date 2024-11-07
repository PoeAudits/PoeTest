// SPDX-License-Identifier: GPL-2.0
pragma solidity ^0.8.0;

abstract contract Arrays {
    function SumAllStorage(uint256[] storage arr) internal view returns (uint256 sumAllValue) {
        if (arr.length != 0) {
            return SumToStorage(arr, arr.length - 1);
        }
    }

    function SumAllMemory(uint256[] memory arr) internal pure returns (uint256 sumAllValue) {
        if (arr.length != 0) {
            return SumToMemory(arr, arr.length - 1);
        }
    }

    function SumToStorage(uint256[] storage arr, uint256 sumToIndex) internal view returns (uint256 sumToValue) {
        for (uint256 i; i <= sumToIndex; ++i) {
            sumToValue += arr[i];
        }
    }

    function SumToMemory(uint256[] memory arr, uint256 sumToIndex) internal pure returns (uint256 sumToValue) {
        for (uint256 i; i <= sumToIndex; ++i) {
            sumToValue += arr[i];
        }
    }

    function GetLatest(uint256[] storage arr) internal view returns (uint256 lastValue) {
        return arr[arr.length - 1];
    }
}
