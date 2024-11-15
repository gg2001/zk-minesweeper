pragma circom 2.2.0;

include "../node_modules/circomlib/circuits/comparators.circom";
include "./minesweeper.circom";

template Init (width, height, bombs) {
    signal input grid[width * height];
    signal input salt;

    signal output id;

    // Ensure that the grid size is less than 10 bits
    assert((width * height) <= 2**10);

    // Grid bomb count check
    signal bombCount[(width * height) + 1];
    bombCount[0] <== 0;
    for (var i = 0; i < (width * height); i++) {
        // Grid values must be 0 or 1
        grid[i] * (grid[i] - 1) === 0;

        bombCount[i + 1] <== bombCount[i] + grid[i];
    }
    bombCount[width * height] === bombs;

    // Safe click cell in the grid
    grid[0] === 0;

    // Hash to generate ID
    component hash = Hash(width * height, 80);
    for (var i = 0; i < (width * height); i++) {
        hash.grid[i] <== grid[i];
    }
    hash.salt <== salt;
    id <== hash.out;
}

component main = Init(10, 8, 10);
