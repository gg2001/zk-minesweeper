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
