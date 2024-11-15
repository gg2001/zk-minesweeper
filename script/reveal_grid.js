/* eslint-disable @typescript-eslint/no-require-imports */
const fs = require("fs");

// Read and parse the JSON file
const data = JSON.parse(fs.readFileSync("./circuits/reveal.json", "utf8"));

// Function to display the grid
function displayGrid(grid) {
	const width = 10;
	const height = 8;

	for (let row = 0; row < height; row++) {
		let line = "";
		for (let col = 0; col < width; col++) {
			const index = row * width + col;
			line += grid[index] + " ";
		}
		console.log(line);
	}
}

// Display the grid
displayGrid(data.grid);
