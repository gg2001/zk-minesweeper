pragma circom 2.2.0;

include "../node_modules/circomlib/circuits/comparators.circom";
include "./minesweeper.circom";

template Reveal (n) {
    signal input grid[n];
    signal input width;
    signal input height;
    signal input bombs;
    signal input salt;
    signal input id;
    signal input index;

    signal output out[n];
    signal output bomb;

    // Validate the hash
    component hash = Hash(n, 80);
    for (var i = 0; i < n; i++) {
        hash.grid[i] <== grid[i];
    }
    hash.width <== width;
    hash.height <== height;
    hash.bombs <== bombs;
    hash.salt <== salt;
    id === hash.out;

    // Check if the index is a bomb
    component eq[n];
    signal tempBomb[n+1];
    tempBomb[0] <== 0;
    for (var i = 0; i < n; i++) {
        eq[i] = IsEqual();
        eq[i].in[0] <== index;
        eq[i].in[1] <== i;
        tempBomb[i+1] <== tempBomb[i] + eq[i].out * grid[i];
    }
    bomb <== tempBomb[n];

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
    var temp[n];
    for (var i = 0; i < n; i++) {
        temp[i] = bomb * grid[i];
    }

    // Output
    for (var i = 0; i < n; i++) {
        out[i] <== temp[i];
    }
}

component main { public [ id, index ] } = Reveal(480);
