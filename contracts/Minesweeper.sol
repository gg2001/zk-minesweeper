// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {InitVerifier} from "./verifiers/InitVerifier.sol";

contract Minesweeper {
    InitVerifier public initVerifier;

    mapping(uint256 => bool) public commitments;

    constructor(address _initVerifier) {
        initVerifier = InitVerifier(_initVerifier);
    }

    function init(
        uint256[2] calldata _pA,
        uint256[2][2] calldata _pB,
        uint256[2] calldata _pC,
        uint256[1] calldata _pubSignals
    ) public {
        require(initVerifier.verifyProof(_pA, _pB, _pC, _pubSignals), "Invalid proof");
        commitments[_pubSignals[0]] = true;
    }
}
