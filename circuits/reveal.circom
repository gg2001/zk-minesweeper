pragma circom 2.2.0;

include "../node_modules/circomlib/circuits/comparators.circom";
include "./minesweeper.circom";

template Reveal (width, height, bombs) {
    signal input grid[width * height]; // row-major
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
    component eq[(width * height)];
    signal tempBomb[(width * height) + 1];
    tempBomb[0] <== 0;
    for (var i = 0; i < (width * height); i++) {
        eq[i] = IsEqual();
        eq[i].in[0] <== index;
        eq[i].in[1] <== i;
        tempBomb[i+1] <== tempBomb[i] + eq[i].out * grid[i];
    }
    bomb <== tempBomb[(width * height)];

    // Calculate the neighbor bomb counts for each cell
    // signal neighborCounts[n];
    // component isValidNeighbor[n][8];  // 8 neighbors per cell
    // for (var i = 0; i < n; i++) {
    //     for (var j = 0; j < 8; j++) {
    //         isValidNeighbor[i][j] = GreaterEqThan(10);
    //     }
    // }

    // signal neighborValues[n][8];
    // // var neighborCount = 0;
    // signal neighborCount[n][8+1];
    // for (var i = 0; i < n; i++) {
    //     var y = i \ width;
    //     var x = i % width;

    //     var neighbor = 0;
    //     for (var dy = -1; dy <= 1; dy++) {
    //         for (var dx = -1; dx <= 1; dx++) {
    //             // Skip the cell
    //             if (dx != 0 || dy != 0) {
    //                 var ny = y + dy;
    //                 var nx = x + dx;
    //                 // ((i \ width) + dy) * width + ((i % width) + dx)
    //                 // (i + dy * width) + ((i % width) + dx)
    //                 var neighborIdx = ny * width + nx;

    //                 isValidNeighbor[i][neighbor].in[0] <-- neighborIdx;
    //                 isValidNeighbor[i][neighbor].in[0] % width === 0;
    //                 isValidNeighbor[i][neighbor].in[1] <== 0;
    //                 neighborCount[i][neighbor+1] <-- grid[isValidNeighbor[i][neighbor].out * neighborIdx];


    //                 // isValidNeighbor[i][neighbor] = IsEqual();
    //                 // isValidNeighbor[i][neighbor].in[0] <== 1;
    //                 // sValidNeighbor[i][neighbor].in[1] <== (ny >= 0 && ny < height && nx >= 0 && nx < width && neighborIdx < n) ? 1 : 0;
                    
    //                 //neighborValues[i][neighbor] <== isValidNeighbor[i][neighbor].out * (neighborIdx < n ? grid[neighborIdx] : 0);
    //                 //neighborCount += neighborValues[i][neighbor];
    //                 // neighbor++;
    //                 neighbor++;
    //             }
    //         }
    //     }
    //     neighborCounts[i] <== 0;
    // }

    // If the index is a bomb, reveal the entire grid
    var temp[(width * height)];
    for (var i = 0; i < (width * height); i++) {
        temp[i] = bomb * grid[i];
    }

    // Output
    for (var i = 0; i < (width * height); i++) {
        out[i] <== temp[i];
    }
}

component main { public [ id, index ] } = Reveal(10, 8, 10);
