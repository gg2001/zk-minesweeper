/* eslint-disable @typescript-eslint/no-require-imports */
const crypto = require("crypto");

const beacon = crypto.randomBytes(32).toString("hex");
process.stdout.write(beacon);
process.exit(0);
