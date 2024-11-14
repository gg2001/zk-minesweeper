// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Minesweeper} from "../contracts/Minesweeper.sol";
import {InitVerifier} from "../contracts/verifiers/InitVerifier.sol";

contract MinesweeperTest is Test {
    struct Grid {
        uint256[][] cells;
        uint256 width;
        uint256 height;
        uint256 bombs;
        uint256 salt;
    }

    Minesweeper public minesweeper;

    function setUp() public {
        InitVerifier initVerifier = new InitVerifier();
        minesweeper = new Minesweeper(address(initVerifier));
    }

    function mockGrid() public pure returns (Grid memory grid) {
        grid.cells = new uint256[][](8);
        for (uint256 i = 0; i < 8; i++) {
            grid.cells[i] = new uint256[](10);
        }

        grid.cells[0][1] = 1;
        grid.cells[0][2] = 1;
        grid.cells[0][7] = 1;
        grid.cells[0][9] = 1;
        grid.cells[1][1] = 1;
        grid.cells[1][6] = 1;
        grid.cells[2][1] = 1;
        grid.cells[2][8] = 1;
        grid.cells[3][5] = 1;
        grid.cells[3][6] = 1;

        grid.width = 10;
        grid.height = 8;
        grid.bombs = 10;
        grid.salt = 1;
    }

    function proveInit(Grid memory grid)
        public
        returns (uint256[2] memory pA, uint256[2][2] memory pB, uint256[2] memory pC, uint256[4] memory pubSignals)
    {
        bytes memory input = abi.encode(grid.cells, grid.width, grid.height, grid.bombs, grid.salt);

        string[] memory inputs = new string[](3);
        inputs[0] = "node";
        inputs[1] = "script/provers/init.js";
        inputs[2] = vm.toString(input);

        bytes memory result = vm.ffi(inputs);

        (pA, pB, pC, pubSignals) = abi.decode(result, (uint256[2], uint256[2][2], uint256[2], uint256[4]));
    }

    function test_Init() public {
        Grid memory grid = mockGrid();

        (uint256[2] memory pA, uint256[2][2] memory pB, uint256[2] memory pC, uint256[4] memory pubSignals) =
            proveInit(grid);

        minesweeper.init(pA, pB, pC, pubSignals);
    }
}
