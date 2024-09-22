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
	}
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
			"#10 x = 1'b1; y = 1'b1; z = 1'b1;",
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
			"#10 A = 1'b1; B = 1'b1; C = 1'b1; D = 1'b1;",
		],
		"description": "A B C D input combinations"
	}

```
