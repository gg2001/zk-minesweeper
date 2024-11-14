// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Counter} from "../contracts/Counter.sol";

contract CounterTest is Test {
    Counter public counter;

    function setUp() public {
        counter = new Counter();
        counter.setNumber(0);
    }

    function test_Increment() public {
        counter.increment();
        assertEq(counter.number(), 1);

        uint256[10][8] memory grid;
        for (uint256 i = 0; i < 8; i++) {
            for (uint256 j = 0; j < 10; j++) {
                grid[i][j] = 0;
            }
        }
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

        bytes memory encoded = abi.encode(grid, 10, 8, 10, 1);
        console.logBytes(encoded);
    }

    function testFuzz_SetNumber(uint256 x) public {
        counter.setNumber(x);
        assertEq(counter.number(), x);
    }
}
