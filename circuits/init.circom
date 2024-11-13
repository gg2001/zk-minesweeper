pragma circom 2.1.6;

include "../node_modules/circomlib/circuits/mimcsponge.circom";
include "../node_modules/circomlib/circuits/comparators.circom";

template Init (n, maxBombs) {
    signal input grid[n];
    signal input width;
    signal input height;
    signal input bombs;
    signal input salt;

    signal output id;

    component widthGreaterThanOne = GreaterThan(8);
    widthGreaterThanOne.in[0] <== width;
    widthGreaterThanOne.in[1] <== 1;
    widthGreaterThanOne.out === 1;

    component widthLessThanN = LessThan(8);
    widthLessThanN.in[0] <== width;
    widthLessThanN.in[1] <== n;
    widthLessThanN.out === 1;

    component heightGreaterThanOne = GreaterThan(8);
    heightGreaterThanOne.in[0] <== height;
    heightGreaterThanOne.in[1] <== 1;
    heightGreaterThanOne.out === 1;

    component heightLessThanN = LessThan(8);
    heightLessThanN.in[0] <== height;
    heightLessThanN.in[1] <== n;
    heightLessThanN.out === 1;

    signal squares;
    squares <== width * height;

    component lessThanN = LessEqThan(8);
    lessThanN.in[0] <== squares;
    lessThanN.in[1] <== n;
    lessThanN.out === 1;

    component bombsGreaterThanZero = GreaterThan(8);
    bombsGreaterThanZero.in[0] <== bombs;
    bombsGreaterThanZero.in[1] <== 0;
    bombsGreaterThanZero.out === 1;

    component lessThanMax = LessEqThan(8);
    lessThanMax.in[0] <== bombs;
    lessThanMax.in[1] <== maxBombs;
    lessThanMax.out === 1;

    var bombCount = 0;
    for (var i = 0; i < n; i++) {
        grid[i] * (grid[i] - 1) === 0;

        bombCount += grid[i];
    }
    bombCount === bombs;

    component mimc = MiMCSponge(n + 1, 220, 1);
    for (var i = 0; i < n; i++) {
        mimc.ins[i] <== grid[i];
    }
    mimc.ins[n] <== salt;
    mimc.k <== 0;

    id <== mimc.outs[0];
}

component main { public [ width, height, bombs ] } = Init(480, 99);
