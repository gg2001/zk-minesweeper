pragma circom 2.2.0;

include "../node_modules/circomlib/circuits/comparators.circom";
include "./minesweeper.circom";

template Reveal (width, height, bombs) {
    signal input grid[width * height];
    signal input salt;
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

    // Check if the index is a bomb
    component indexEqual[width * height];
    signal bombAccumulator[(width * height) + 1];
    bombAccumulator[0] <== 0;
    for (var i = 0; i < (width * height); i++) {
        indexEqual[i] = IsEqual();
        indexEqual[i].in[0] <== index;
        indexEqual[i].in[1] <== i;
        bombAccumulator[i+1] <== bombAccumulator[i] + (indexEqual[i].out * grid[i]);
    }
    bomb <== bombAccumulator[width * height];

    // Sum the neighbor bomb counts for each cell
    signal neighborCounts[width * height];
    signal neighborAccumulator[width * height][8 + 1];
    for (var x = 0; x < width; x++) {
        for (var y = 0; y < height; y++) {
            var i = y * width + x;

            var j = 0;
            neighborAccumulator[i][j] <== 0;
            for (var dy = -1; dy <= 1; dy++) {
                for (var dx = -1; dx <= 1; dx++) {
                    if (dx != 0 || dy != 0) {
                        var neighbor = ((y + dy) * width) + (x + dx);

                        neighborAccumulator[i][j + 1] <==
                            neighborAccumulator[i][j] + (neighbor >= 0 && neighbor < (width * height) ? grid[neighbor] : 0);
                        j++;
                    }
                }
            }

            neighborCounts[i] <== neighborAccumulator[i][8];
        }
    }

    // Reveal partial neighbor counts
    var partialReveal[width * height];
    var nextCell = index;
    for (var i = 0; i < (width * height); i++) {
        partialReveal[i] = bomb * grid[i];

        for (var j = 0; j < i; j++) {
            partialReveal[i] += neighborCounts[j];
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
