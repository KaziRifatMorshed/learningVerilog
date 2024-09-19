# learning Verilog
this repo contains the Verilog codes that I learned from the CSE 2205: DIGITAL LOGIC DESIGN course conducted by Prof. Anisur Rahman, PhD, CSE Discipline, Khulna University.

# Compiler Command
I am using this command in [CodeRunner](https://marketplace.visualstudio.com/items?itemName=formulahendry.code-runner) to compile and run test bench of my verilog code in GTKwave. Please edit the file `~/.config/Code - OSS/User/profiles/-5d9ac861/settings.json` {self service} (NOTE: this is my linux system's one and I am actually using OSS Code)

```json
    ".v": "cd $dir && iverilog $fileName -o $fileNameWithoutExt.vvp && vvp $fileNameWithoutExt.vvp && gtkwave $fileNameWithoutExt.vcd",
```

# My VS Code snippet

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
			"output $1,"
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
	"$dump": {
		"prefix": "dump",
		"body": [
			"		$dumpfile(\"$1\");",
			"		$dumpvars(0, $2);",
			"$3"
		],
		"description": "x, y, z"
	}
```
