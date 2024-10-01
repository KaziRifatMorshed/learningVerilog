# learning Verilog

this repo contains the Verilog codes that I learned from the CSE 2205: DIGITAL LOGIC DESIGN course conducted by Prof. Anisur Rahman, PhD, CSE Discipline, Khulna University.

# Compiler Command

I am using this command in [CodeRunner](https://marketplace.visualstudio.com/items?itemName=formulahendry.code-runner) to compile and run test bench of my verilog code in GTKwave. Please edit the file `~/.config/Code - OSS/User/profiles/-5d9ac861/settings.json` {self service} (NOTE: this is my linux system's one and I am actually using OSS Code)

```json
        ".v": "cd $dir && mkdir -p output && iverilog $fileName -o ./output/$fileNameWithoutExt.vvp && cd output && vvp $fileNameWithoutExt.vvp && gtkwave $fileNameWithoutExt.vcd",
```

# My VS Code snippet

`~/.config/Code - OSS/User/profiles/-5d9ac861/snippets/verilog.json`

```json
{
	// Place your snippets for verilog here. Each snippet is defined under a snippet name and has a prefix, body and 
	// description. The prefix is what is used to trigger the snippet and the body will be expanded and inserted. Possible variables are:
	// $1, $2 for tab stops, $0 for the final cursor position, and ${1:label}, ${2:another} for placeholders. Placeholders with the 
	// same ids are connected.
	// Example:
	// "Print to console": {
	// 	"prefix": "log",
	// 	"body": [
	// 		"console.log('$1');",
	// 		"$2"
	// 	],
	// 	"description": "Log output to console"
	// }
	"assign...": {
		"prefix": "ass",
		"body": [
			"assign $1 = $2;",
			"$0"
		],
		"description": "assign...."
	},
	"output...": {
		"prefix": "out",
		"body": [
			"output $1"
		],
		"description": "output...."
	},
	"input...": {
		"prefix": "in",
		"body": [
			"input $1,"
		],
		"description": "input...."
	},
	"x, y, z": {
		"prefix": "x",
		"body": [
			"x, y, z"
		],
		"description": "x, y, z"
	},
	"A, B, C, D": {
		"prefix": "A",
		"body": [
			"A, B, C, D"
		],
		"description": "A, B, C, D"
	},
	"$dump": {
		"prefix": "dump",
		"body": [
			"$$dumpfile(\"$1\");",
			"$$dumpvars(0, $2);",
			"$3"
		],
		"description": "x, y, z"
	},
	"3input": {
		"prefix": "3input_x_y_z",
		"body": [
			"    x = 1'b0; y = 1'b0; z = 1'b0;",
			"#10 x = 1'b0; y = 1'b0; z = 1'b1;",
			"#10 x = 1'b0; y = 1'b1; z = 1'b0;",
			"#10 x = 1'b0; y = 1'b1; z = 1'b1;",
			"#10 x = 1'b1; y = 1'b0; z = 1'b0;",
			"#10 x = 1'b1; y = 1'b0; z = 1'b1;",
			"#10 x = 1'b1; y = 1'b1; z = 1'b0;",
			"#10 x = 1'b1; y = 1'b1; z = 1'b1;"
		],
		"description": "3 possible input combinations"
	},
	"4input": {
		"prefix": "4input",
		"body": [
			"    A = 1'b0; B = 1'b0; C = 1'b0; D = 1'b0;",
			"#10 A = 1'b0; B = 1'b0; C = 1'b0; D = 1'b1;",
			"#10 A = 1'b0; B = 1'b0; C = 1'b1; D = 1'b0;",
			"#10 A = 1'b0; B = 1'b0; C = 1'b1; D = 1'b1;",
			"#10 A = 1'b0; B = 1'b1; C = 1'b0; D = 1'b0;",
			"#10 A = 1'b0; B = 1'b1; C = 1'b0; D = 1'b1;",
			"#10 A = 1'b0; B = 1'b1; C = 1'b1; D = 1'b0;",
			"#10 A = 1'b0; B = 1'b1; C = 1'b1; D = 1'b1;",
			"#10 A = 1'b1; B = 1'b0; C = 1'b0; D = 1'b0;",
			"#10 A = 1'b1; B = 1'b0; C = 1'b0; D = 1'b1;",
			"#10 A = 1'b1; B = 1'b0; C = 1'b1; D = 1'b0;",
			"#10 A = 1'b1; B = 1'b0; C = 1'b1; D = 1'b1;",
			"#10 A = 1'b1; B = 1'b1; C = 1'b0; D = 1'b0;",
			"#10 A = 1'b1; B = 1'b1; C = 1'b0; D = 1'b1;",
			"#10 A = 1'b1; B = 1'b1; C = 1'b1; D = 1'b0;",
			"#10 A = 1'b1; B = 1'b1; C = 1'b1; D = 1'b1;"
		],
		"description": "x, y, z"
	}
	// "x, y, z": {
	// 	"prefix": "xyz",
	// 	"body": [
	// 		"xyz"
	// 	],
	// 	"description": "xyz"
	// }
}
```
