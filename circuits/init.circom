pragma circom 2.2.0;

include "../node_modules/circomlib/circuits/comparators.circom";
include "./minesweeper.circom";

template Init (n, maxBombs) {
    signal input grid[n];
    signal input width;
    signal input height;
    signal input bombs;
    signal input salt;

    signal output id;

    // Width checks
    component widthGreaterThanOne = GreaterThan(8);
    widthGreaterThanOne.in[0] <== width;
    widthGreaterThanOne.in[1] <== 1;
    widthGreaterThanOne.out === 1;

    component widthLessThanN = LessThan(8);
    widthLessThanN.in[0] <== width;
    widthLessThanN.in[1] <== n;
    widthLessThanN.out === 1;

    // Height checks
    component heightGreaterThanOne = GreaterThan(8);
    heightGreaterThanOne.in[0] <== height;
    heightGreaterThanOne.in[1] <== 1;
    heightGreaterThanOne.out === 1;

    component heightLessThanN = LessThan(8);
    heightLessThanN.in[0] <== height;
    heightLessThanN.in[1] <== n;
    heightLessThanN.out === 1;

    // Grid size checks
    signal squares;
    squares <== width * height;

    component lessThanN = LessEqThan(8);
    lessThanN.in[0] <== squares;
    lessThanN.in[1] <== n;
    lessThanN.out === 1;

    // Bomb count checks
    component bombsGreaterThanZero = GreaterThan(8);
    bombsGreaterThanZero.in[0] <== bombs;
    bombsGreaterThanZero.in[1] <== 0;
    bombsGreaterThanZero.out === 1;

    component lessThanMax = LessEqThan(8);
    lessThanMax.in[0] <== bombs;
    lessThanMax.in[1] <== maxBombs;
    lessThanMax.out === 1;

    // Grid bomb count check
    var bombCount = 0;
    for (var i = 0; i < n; i++) {
        // Grid values must be 0 or 1
        grid[i] * (grid[i] - 1) === 0;

        bombCount += grid[i];
    }
    bombCount === bombs;

    // Safe click spot in the grid
    grid[0] === 0;

    // Hash to generate ID
    component hash = Hash(n, 80);
    for (var i = 0; i < n; i++) {
        hash.grid[i] <== grid[i];
    }
    hash.width <== width;
    hash.height <== height;
    hash.bombs <== bombs;
    hash.salt <== salt;
    id <== hash.out;
}

component main { public [ width, height, bombs ] } = Init(80, 10);
