pragma circom 2.2.0;

include "../node_modules/circomlib/circuits/comparators.circom";
include "./minesweeper.circom";

template Reveal (width, height, bombs) {
    // Private
    signal input grid[width * height];
    signal input salt;
    // Public
    signal input id;
    signal input index;

    signal output out[width * height];
    signal output bomb;

    // Validate the hash
    component hash = Hash(width * height, 80);
    for (var i = 0; i < (width * height); i++) {
        hash.grid[i] <== grid[i];
    }
    hash.salt <== salt;
    id === hash.out;

    // Ensure the index is valid
    component indexValid = LessThan(10);
    indexValid.in[0] <== index;
    indexValid.in[1] <== width * height;
    indexValid.out === 1;

    // Check if the index is a bomb
    // Components
    component indexEqual[width * height];
    // Accumulators
    signal bombAccumulator[(width * height) + 1];
    bombAccumulator[0] <== 0;
    for (var i = 0; i < (width * height); i++) {
        indexEqual[i] = IsEqual();
        indexEqual[i].in[0] <== index;
        indexEqual[i].in[1] <== i;
        bombAccumulator[i+1] <== bombAccumulator[i] + (indexEqual[i].out * grid[i]);
    }
    // bomb = 1 if the index is a bomb, else 0
    bomb <== bombAccumulator[width * height];

    // Sum the neighbor bomb counts for each cell
    // Signals
    signal neighborCounts[width * height];
    // Accumulators
    signal neighborAccumulator[width * height][8+1];
    for (var x = 0; x < width; x++) {
        for (var y = 0; y < height; y++) {
            var i = y * width + x;

            var j = 0;
            neighborAccumulator[i][j] <== 0;
            for (var dy = -1; dy <= 1; dy++) {
                for (var dx = -1; dx <= 1; dx++) {
                    if (dx != 0 || dy != 0) {
                        var neighbor = ((y + dy) * width) + (x + dx);

                        neighborAccumulator[i][j+1] <== neighborAccumulator[i][j] +
                            (neighbor >= 0 && neighbor < (width * height) ? grid[neighbor] : 0);
                        j++;
                    }
                }
            }

            neighborCounts[i] <== neighborAccumulator[i][8];
        }
    }

    // Reveal partial neighbor counts
    // Signals
    signal nextCell[((width * height) * 9) + 1];
    signal cellNeighbors[width * height];
    signal validCell[width * height];
    nextCell[0] <== index;
    // Components
    component nextCellPositive[width * height];
    component nextCellEqual[width * height][width * height];
    component neighborCountIsZero[width * height];
    // Accumulators
    signal neighborCountAccumulator[width * height][(width * height) + 1];
    // Variables
    var cellIndex = 0;
    for (var i = 0; i < (width * height); i++) {
        // out = 1 if nextCell[i] >= 0, else 0
        nextCellPositive[i] = GreaterEqThan(10);
        nextCellPositive[i].in[0] <== nextCell[i];
        nextCellPositive[i].in[1] <== 0;

        // cellNeighbors[i] = neighborCounts[nextCell[i]]
        neighborCountAccumulator[i][0] <== 0;
        for (var j = 0; j < (width * height); j++) {
            nextCellEqual[i][j] = IsEqual();
            nextCellEqual[i][j].in[0] <== nextCell[i];
            nextCellEqual[i][j].in[1] <== j;
            neighborCountAccumulator[i][j+1] <== neighborCountAccumulator[i][j] + (nextCellEqual[i][j].out * neighborCounts[j]);
        }
        cellNeighbors[i] <== neighborCountAccumulator[i][width * height];

        // out = 1 if cellNeighbors[i] == 0, else 0
        neighborCountIsZero[i] = IsZero();
        neighborCountIsZero[i].in <== cellNeighbors[i];

        // validCell[i] = 1 if (nextCellPositive[i].out == 1 && neighborCountIsZero[i].out == 1), else 0
        validCell[i] <== nextCellPositive[i].out * neighborCountIsZero[i].out;

        // Calculate the next cell index
        var x = i % width;
        var y = i / width;
        for (var dy = -1; dy <= 1; dy++) {
            for (var dx = -1; dx <= 1; dx++) {
                var nextCellIndex = ((y + dy) * width) + (x + dx);

                nextCell[cellIndex+1] <== validCell[i] * (nextCellIndex >= 0 && nextCellIndex < (width * height) ? nextCellIndex : -1) + (1 - validCell[i]) * (-1);
                cellIndex++;
            }
        }
    }

    // If the index is a bomb, reveal the entire grid
    var fullReveal[width * height];
    for (var i = 0; i < (width * height); i++) {
        fullReveal[i] = bomb * grid[i];
    }

    // Output
    for (var i = 0; i < (width * height); i++) {
        out[i] <== fullReveal[i];
    }
}

component main { public [ id, index ] } = Reveal(10, 8, 10);
