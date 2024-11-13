pragma circom 2.1.6;

include "../node_modules/circomlib/circuits/mimcsponge.circom";
include "../node_modules/circomlib/circuits/comparators.circom";

template Init (n, maxBombs) {
    signal input grid[n];
    signal input bombs;
    signal input salt;

    signal output id;
    
    component greaterThanZero = GreaterThan(8);
    greaterThanZero.in[0] <== bombs;
    greaterThanZero.in[1] <== 0;
    greaterThanZero.out === 1;

    component lessThanMax = LessEqThan(8);
    lessThanMax.in[0] <== bombs;
    lessThanMax.in[1] <== maxBombs;
    lessThanMax.out === 1;

    var bombCount = 0;
    var gridBits = 0;
    for (var i = 0; i < n; i++) {
        bombCount += grid[i];
        gridBits += (1 << i) * grid[i];
    }
    bombCount === bombs;

    component mimc = MiMCSponge(2, 220, 1);
    mimc.ins[0] <== gridBits;
    mimc.ins[1] <== salt;
    mimc.k <== 0;

    id <== mimc.outs[0];
}

component main { public [ bombs ] } = Init(480, 99);
