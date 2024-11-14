/* eslint-disable @typescript-eslint/no-require-imports */
const path = require("path");
const snarkjs = require("snarkjs");
const { encodeAbiParameters, decodeAbiParameters } = require("viem");

async function main() {
	const rawInput = process.argv[2];
	const decodedInput = decodeAbiParameters(
		[
			{ type: "uint256[10][8]" },
			{ type: "uint256" },
			{ type: "uint256" },
			{ type: "uint256" },
			{ type: "uint256" },
		],
		rawInput,
	);

	const grid = decodedInput[0].flat().map((cell) => cell.toString());
	const width = decodedInput[1].toString();
	const height = decodedInput[2].toString();
	const bombs = decodedInput[3].toString();
	const salt = decodedInput[4].toString();

	const input = { grid, width, height, bombs, salt };

	const { proof, publicSignals } = await snarkjs.groth16.fullProve(
		input,
		path.join(__dirname, "../../public/init.wasm"),
		path.join(__dirname, "../../public/init.zkey"),
	);

	const pA = proof.pi_a.slice(0, -1).map((signal) => BigInt(signal));
	// Flip the order of the inner signals in pB
	const pB = proof.pi_b
		.slice(0, -1)
		.map((signal) => signal.reverse().map((s) => BigInt(s)));
	const pC = proof.pi_c.slice(0, -1).map((signal) => BigInt(signal));
	const pubSignals = publicSignals.map((signal) => BigInt(signal));

	const output = encodeAbiParameters(
		[
			{ type: "uint256[2]" },
			{ type: "uint256[2][2]" },
			{ type: "uint256[2]" },
			{ type: "uint256[4]" },
		],
		[pA, pB, pC, pubSignals],
	);
	process.stdout.write(output);
}

main()
	.then(() => {
		process.exit(0);
	})
	.catch((error) => {
		console.error(error);
		process.exit(1);
	});
