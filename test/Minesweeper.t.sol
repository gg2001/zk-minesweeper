// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Minesweeper} from "../contracts/Minesweeper.sol";
import {InitVerifier} from "../contracts/verifiers/InitVerifier.sol";
import {RevealVerifier} from "../contracts/verifiers/RevealVerifier.sol";

contract MinesweeperTest is Test {
    Minesweeper public minesweeper;

    function setUp() public {
        InitVerifier initVerifier = new InitVerifier();
        RevealVerifier revealVerifier = new RevealVerifier();
        minesweeper = new Minesweeper(address(initVerifier), address(revealVerifier));
    }

    struct Grid {
        uint256[][] cells;
        uint256 width;
        uint256 height;
        uint256 bombs;
        uint256 salt;
    }

    function mockGrid() public pure returns (Grid memory grid) {
        grid.width = 10;
        grid.height = 8;
        grid.bombs = 10;
        grid.salt = 1;

        grid.cells = new uint256[][](grid.height);
        for (uint256 i = 0; i < grid.height; i++) {
            grid.cells[i] = new uint256[](grid.width);
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
    }

    struct Init {
        uint256[2] pA;
        uint256[2][2] pB;
        uint256[2] pC;
        uint256[1] pubSignals;
        uint256 id;
    }

    function proveInit(Grid memory grid) public returns (Init memory init) {
        bytes memory input = abi.encode(grid.cells, grid.salt);

        string[] memory inputs = new string[](3);
        inputs[0] = "node";
        inputs[1] = "script/provers/init.js";
        inputs[2] = vm.toString(input);

        bytes memory result = vm.ffi(inputs);

        (init.pA, init.pB, init.pC, init.pubSignals) =
            abi.decode(result, (uint256[2], uint256[2][2], uint256[2], uint256[1]));
        init.id = init.pubSignals[0];
    }

    struct Reveal {
        uint256[2] pA;
        uint256[2][2] pB;
        uint256[2] pC;
        uint256[83] pubSignals;
        uint256[][] grid;
    }

    function proveReveal(Grid memory grid, uint256 id, uint256 index) public returns (Reveal memory reveal) {
        bytes memory input = abi.encode(grid.cells, grid.salt, id, index);

        string[] memory inputs = new string[](3);
        inputs[0] = "node";
        inputs[1] = "script/provers/reveal.js";
        inputs[2] = vm.toString(input);

        bytes memory result = vm.ffi(inputs);

        (reveal.pA, reveal.pB, reveal.pC, reveal.pubSignals) =
            abi.decode(result, (uint256[2], uint256[2][2], uint256[2], uint256[83]));

        reveal.grid = new uint256[][](grid.height);
        for (uint256 i = 0; i < grid.height; i++) {
            reveal.grid[i] = new uint256[](grid.width);
        }

        for (uint256 i = 0; i < (grid.width * grid.height); i++) {
            reveal.grid[i / grid.width][i % grid.width] = reveal.pubSignals[i];
        }
    }

    function test_Init() public {
        Grid memory grid = mockGrid();

        Init memory init = proveInit(grid);
        minesweeper.init(init.pA, init.pB, init.pC, init.pubSignals);
    }

    function test_Reveal() public {
        Grid memory grid = mockGrid();
        Init memory init = proveInit(grid);
        minesweeper.init(init.pA, init.pB, init.pC, init.pubSignals);

        Reveal memory reveal = proveReveal(grid, init.id, 11);
        minesweeper.reveal(reveal.pA, reveal.pB, reveal.pC, reveal.pubSignals);
    }
}
