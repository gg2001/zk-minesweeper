// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {InitVerifier} from "./verifiers/InitVerifier.sol";
import {RevealVerifier} from "./verifiers/RevealVerifier.sol";

contract Minesweeper {
    InitVerifier public initVerifier;
    RevealVerifier public revealVerifier;

    mapping(uint256 => bool) public commitments;

    constructor(address _initVerifier, address _revealVerifier) {
        initVerifier = InitVerifier(_initVerifier);
        revealVerifier = RevealVerifier(_revealVerifier);
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

    function reveal(
        uint256[2] calldata _pA,
        uint256[2][2] calldata _pB,
        uint256[2] calldata _pC,
        uint256[83] calldata _pubSignals
    ) public {
        require(revealVerifier.verifyProof(_pA, _pB, _pC, _pubSignals), "Invalid proof");
        commitments[_pubSignals[0]] = false;
    }
}
