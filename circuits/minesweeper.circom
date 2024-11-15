pragma circom 2.2.0;

include "../node_modules/circomlib/circuits/poseidon.circom";

template Hash (n, batchSize) {
    signal input grid[n]; // row-major
    signal input salt;

    signal output out;

    // n must be a multiple of batchSize
    assert(n % batchSize == 0);

    // Ensure that we don't exceed the Poseidon input limit
    assert(n / batchSize <= 10);
    assert(n / batchSize >= 1);

    // Hash each batch of batchSize bits
    // Components
    component poseidonBatch[n / batchSize];
    component poseidon = Poseidon((n / batchSize) + 1);
    // Accumulators
    signal bitsAccumulator[n / batchSize][batchSize + 1];
    for (var i = 0; i < (n / batchSize); i++) {
        bitsAccumulator[i][0] <== 0;
        for (var j = 0; j < batchSize; j++) {
            bitsAccumulator[i][j + 1] <== bitsAccumulator[i][j] + (grid[i * batchSize + j] * (2 ** j));
        }

        poseidonBatch[i] = Poseidon(2);
        poseidonBatch[i].inputs[0] <== bitsAccumulator[i][batchSize];
        poseidonBatch[i].inputs[1] <== i;

        poseidon.inputs[i] <== poseidonBatch[i].out;
    }

    // Generate hash
    poseidon.inputs[n / batchSize] <== salt;

    out <== poseidon.out;
}
