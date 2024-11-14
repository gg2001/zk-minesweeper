pragma circom 2.2.0;

include "../node_modules/circomlib/circuits/mimcsponge.circom";

template Hash (n) {
    signal input grid[n];
    signal input width;
    signal input height;
    signal input bombs;
    signal input salt;

    signal output out;

    // Hash to generate ID
    component mimc = MiMCSponge(n + 1, 220, 1);
    for (var i = 0; i < n; i++) {
        mimc.ins[i] <== grid[i];
    }
    mimc.ins[n] <== salt;
    mimc.k <== 0;

    out <== mimc.outs[0];
}
