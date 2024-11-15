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
                        var leftCheck = (x == 0) * (neighbor >= (y * width)) + (x != 0) * 1;
                        var rightCheck = (x == width-1) * (neighbor < ((y+1) * width)) + (x != width-1) * 1;

                        neighborAccumulator[i][j+1] <== neighborAccumulator[i][j] +
                            (neighbor >= 0 && neighbor < (width * height) && 
                             leftCheck && rightCheck ? grid[neighbor] : 0);
                        j++;
                    }
                }
            }

            neighborCounts[i] <== neighborAccumulator[i][8];
        }
    }

    // Reveal partial neighbor counts
    // Signals
    signal cell[((width * height) * 9) + 1];
    signal cellNeighbors[width * height];
    signal cellValidTemp[width * height];
    signal cellValid[width * height];
    signal cellX[width * height];
    signal cellY[width * height];
    signal nextCell[width * height][9];
    signal nextCellTemp0[width * height][9];
    signal nextCellTemp1[width * height][9];
    cell[0] <== index * ((-2 * bomb) + 1); // If bomb, start at -1, else 0
    // Components
    component cellPositive[width * height];
    component cellEqual[width * height][width * height];
    component neighborCountIsZero[width * height];
    component nextCellGte[width * height][9];
    component nextCellLt[width * height][9];
    // Accumulators
    signal neighborCountAccumulator[width * height][(width * height) + 1];
    signal cellXAccumulator[width * height][(width * height) + 1];
    signal cellYAccumulator[width * height][(width * height) + 1];
    // Variables
    var cellIndex = 0;
    for (var i = 0; i < (width * height); i++) {
        // out = 1 if cell[i] >= 0, else 0
        cellPositive[i] = GreaterEqThan(10);
        cellPositive[i].in[0] <== cell[i];
        cellPositive[i].in[1] <== 0;

        // cellNeighbors[i] = neighborCounts[cell[i]]
        // cellX[i] = cell[i] % width
        // cellY[i] = cell[i] / width
        neighborCountAccumulator[i][0] <== 0;
        cellXAccumulator[i][0] <== 0;
        cellYAccumulator[i][0] <== 0;
        for (var j = 0; j < (width * height); j++) {
            cellEqual[i][j] = IsEqual();
            cellEqual[i][j].in[0] <== cell[i];
            cellEqual[i][j].in[1] <== j;
            neighborCountAccumulator[i][j+1] <== neighborCountAccumulator[i][j] + (cellEqual[i][j].out * neighborCounts[j]);
            cellXAccumulator[i][j+1] <== cellXAccumulator[i][j] + (cellEqual[i][j].out * (j % width));
            cellYAccumulator[i][j+1] <== cellYAccumulator[i][j] + (cellEqual[i][j].out * (j / width));
        }
        cellNeighbors[i] <== neighborCountAccumulator[i][width * height];
        cellX[i] <== cellXAccumulator[i][width * height];
        cellY[i] <== cellYAccumulator[i][width * height];

        // out = 1 if cellNeighbors[i] == 0, else 0
        neighborCountIsZero[i] = IsZero();
        neighborCountIsZero[i].in <== cellNeighbors[i];

        // cellValid[i] = 1 if (cellPositive[i].out == 1 && neighborCountIsZero[i].out == 1 && bomb == 0), else 0
        cellValidTemp[i] <== cellPositive[i].out * neighborCountIsZero[i].out;
        cellValid[i] <== cellValidTemp[i] * (1 - bomb);

        // Calculate the next cell index
        var j = 0;
        for (var dy = -1; dy <= 1; dy++) {
            for (var dx = -1; dx <= 1; dx++) {
                if (dx != 0 || dy != 0) {
                    // The next cell index
                    nextCell[i][j] <== ((cellY[i] + dy) * width) + (cellX[i] + dx);

                    // nextCellTemp0[i][j] = 1 if nextCell[i][j] >= 0 && nextCell[i][j] < (width * height), else 0
                    nextCellGte[i][j] = GreaterEqThan(10);
                    nextCellGte[i][j].in[0] <== nextCell[i][j];
                    nextCellGte[i][j].in[1] <== 0;

                    nextCellLt[i][j] = LessThan(10);
                    nextCellLt[i][j].in[0] <== nextCell[i][j];
                    nextCellLt[i][j].in[1] <== width * height;

                    nextCellTemp0[i][j] <== nextCellGte[i][j].out * nextCellLt[i][j].out;

                    // nextCellTemp1[i][j] = nextCell[i][j] if nextCellTemp0[i][j] == 1, else -1
                    nextCellTemp1[i][j] <== nextCellTemp0[i][j] * nextCell[i][j] + (1 - nextCellTemp0[i][j]) * (-1);

                    // cell[cellIndex+1] = nextCellTemp1[i][j] if cellValid[i] == 1, else -1
                    cell[cellIndex+1] <== cellValid[i] * nextCellTemp1[i][j] + (1 - cellValid[i]) * (-1);

                    // Increment indices
                    cellIndex++;
                    j++;
                }
            }
        }
    }

    // Signals
    signal partialReveal[width * height];
    signal partialRevealTemp[width * height];
    // Components
    component revealEqual[width * height][width * height];
    // Accumulators
    signal revealAccumulator[width * height][(width * height) + 1];
    signal frequencyAccumulator[width * height][(width * height) + 1];
    for (var i = 0; i < (width * height); i++) {
        // Get the neighbors for the revealed cells
        revealAccumulator[i][0] <== 0;
        frequencyAccumulator[i][0] <== 0;
        for (var j = 0; j < (width * height); j++) {
            revealEqual[i][j] = IsEqual();
            revealEqual[i][j].in[0] <== cell[j];
            revealEqual[i][j].in[1] <== i;
            revealAccumulator[i][j+1] <== revealAccumulator[i][j] + (revealEqual[i][j].out * cellNeighbors[j]);
            frequencyAccumulator[i][j+1] <== frequencyAccumulator[i][j] + revealEqual[i][j].out;
        }

        // partialReveal[i] = revealAccumulator[i][width * height] / frequencyAccumulator[i][width * height]
        // Handle division by 0
        partialRevealTemp[i] <-- frequencyAccumulator[i][width * height] == 0 ? 
            0 : 
            revealAccumulator[i][width * height] \ frequencyAccumulator[i][width * height];
        partialRevealTemp[i] * frequencyAccumulator[i][width * height] === revealAccumulator[i][width * height];
        partialReveal[i] <== partialRevealTemp[i];
    }

    for (var i = 0; i < (width * height); i++) {
        log(i, partialReveal[i]);
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
