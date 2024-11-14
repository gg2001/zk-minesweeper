pragma circom 2.2.0;

include "./minesweeper.circom";

template Reveal (n) {
    signal input grid[n];
    signal input width;
    signal input height;
    signal input bombs;
    signal input salt;
    signal input id;
    signal input index;

    component hash = Hash(n, 80);
    for (var i = 0; i < n; i++) {
        hash.grid[i] <== grid[i];
    }
    hash.width <== width;
    hash.height <== height;
    hash.bombs <== bombs;
    hash.salt <== salt;
    id === hash.out;

    signal output out[n];
}

component main { public [ id, index ] } = Reveal(480);
