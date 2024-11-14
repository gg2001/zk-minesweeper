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

    signal output out[n];
}

component main { public [ id, index ] } = Reveal(480);
