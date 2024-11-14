/* eslint-disable @typescript-eslint/no-require-imports */
const path = require("path");
const snarkjs = require("snarkjs");
const { decodeAbiParameters } = require("viem");

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
    rawInput
  );

  const grid = decodedInput[0].flat().map((cell) => cell.toString());
  const width = decodedInput[1].toString();
  const height = decodedInput[2].toString();
  const bombs = decodedInput[3].toString();
  const salt = decodedInput[4].toString();

  const input = { grid, width, height, bombs, salt };

  const { proof } = await snarkjs.groth16.fullProve(
    input,
    path.join(__dirname, "../../artifacts/circom/init.wasm"),
    path.join(__dirname, "../../artifacts/circom/init.zkey")
  );

  process.stdout.write(JSON.stringify(proof));
}

main()
  .then(() => {
    process.exit(0);
  })
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
