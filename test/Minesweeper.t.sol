// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Minesweeper} from "../contracts/Minesweeper.sol";
import {InitVerifier} from "../contracts/verifiers/InitVerifier.sol";

contract MinesweeperTest is Test {
    Minesweeper public minesweeper;

    function setUp() public {
        InitVerifier initVerifier = new InitVerifier();
        minesweeper = new Minesweeper(address(initVerifier));
    }

    function newGrid() public pure returns (uint256[10][8] memory grid, uint256 salt) {
        grid[0][1] = 1;
        grid[0][2] = 1;
        grid[0][7] = 1;
        grid[0][9] = 1;
        grid[1][1] = 1;
        grid[1][6] = 1;
        grid[2][1] = 1;
        grid[2][8] = 1;
        grid[3][5] = 1;
        grid[3][6] = 1;

        salt = 1;
    }

    function proveInit(uint256[10][8] memory grid, uint256 salt)
        public
        returns (uint256[2] memory pA, uint256[2][2] memory pB, uint256[2] memory pC, uint256[4] memory pubSignals)
    {
        uint256 width = 10;
        uint256 height = 8;
        uint256 bombs = 10;

        bytes memory input = abi.encode(grid, width, height, bombs, salt);

        string[] memory inputs = new string[](3);
        inputs[0] = "node";
        inputs[1] = "script/provers/init.js";
        inputs[2] = vm.toString(input);

        bytes memory result = vm.ffi(inputs);

        (pA, pB, pC, pubSignals) = abi.decode(result, (uint256[2], uint256[2][2], uint256[2], uint256[4]));
    }

    function test_Init() public {
        (uint256[10][8] memory grid, uint256 salt) = newGrid();

        (uint256[2] memory pA, uint256[2][2] memory pB, uint256[2] memory pC, uint256[4] memory pubSignals) =
            proveInit(grid, salt);

        minesweeper.init(pA, pB, pC, pubSignals);
    }
}
