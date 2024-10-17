### `$dumpfile("wand_module.vcd");`

* **Purpose**: This specifies the name of the file where simulation data will be saved. Try to keep it same as the file name.
* **Explanation**:
  * **`wand_module.vcd`**: The `.vcd` stands for **Value Change Dump**, which is a file format that stores information about how signals change during the simulation. This file can be viewed in waveform viewers like GTKWave.
  * You can change the file name to anything that makes sense for your project (e.g., `my_simulation.vcd`).

### `$dumpvars(0, t_wand);`

* **Purpose**: This specifies **which signals in the design will be recorded for waveform dumping**.
* **Explanation of Parameters**:
  * **`0`**: This specifies the level of hierarchy to record signals.
    * `0` means record all signals in the module `t_wand` and all submodules within it.
    * If you wanted to limit signal recording to specific hierarchy levels, you could specify higher numbers (`1`, `2`, etc.). For example, `1` would record only the signals in the current module and not in submodules.
  * **`t_wand`**: This is the top-level module whose signals will be recorded.
    * In this case, it's your testbench (`t_wand`). All signals in this testbench and any submodules it instantiates will be included in the `.vcd` file for viewing.

### How They Work Together:

1. **`$dumpfile`**: Creates the VCD file with the specified name.
2. **`$dumpvars`**: Specifies which signals (based on hierarchy) to save to the VCD file.

#### Example Workflow:

1. When you run the simulation, the simulator generates the `.vcd` file (`wand_module.vcd`).
2. You can open this file in a waveform viewer like **GTKWave** to see the value changes for signals in `t_wand` and its submodules.
3. This allows you to debug the simulation by observing how signals such as `A`, `B`, `C`, `D`, `z`, and `q` change over time.

### Summary:

* `$dumpfile("filename.vcd")`: Defines where to save the simulation waveform.
* `$dumpvars(level, module)`: Determines the hierarchy level (`0` means all signals) and which module to dump waveforms from.

***

The statement `always @ (a or b or c or d or s0 or s1)` is used in Verilog to define the sensitivity list of an always block. The sensitivity list tells the Verilog simulator when to execute the logic inside the always block, based on changes to the listed signals.

Components:
always @ ( ... ): This specifies that the block will be triggered (executed) when any of the signals in the parentheses change.
Signals inside the parentheses: The list a, b, c, d, s0, s1 are the signals that the block is sensitive to. When any of these signals undergo a change, the logic inside the always block is evaluated.

Detailed Explanation:
a or b or c or d or s0, s1:
This list contains signals that could be inputs or intermediate signals in the design.
The block will be executed whenever any one of the signals a, b, c, d, s0, or s1 changes value.
Notice the mistake in the sensitivity list: s0, s1 should be written as s0 or s1. The comma in the sensitivity list is incorrect. It should use or between signals.

***

- custom module use korle oi module er instance name dibo.
- `assign {C_out, Sum} = A + B + C_in;`


***

wire - output purpose\
reg - input purpose (as we will test all possible inputs)

***

```verilog
    mux_2x1 mux_2x1(
        .F(out),
        .I({d1, d0}),
        .S(s)
    );
```

# Monitor

```verilog
    initial $monitor ("a = ", a, ", b = ", b, ", carry = ", c, " sum = ", s);

    always @(d0 or d1 or s) // mux_2x1
        $monitor("At time = %t, d0 = %b, d1 = %b, s = %b, Output = %b", $time, d0, d1, s, out);
```
Key Differences:\
Initial $monitor: Automatically tracks changes and prints values whenever they change, without needing an always @ block. It's simpler and more intuitive.\
Always @ $monitor: Redundant and less common, because $monitor already triggers on changes, making the always sensitivity list unnecessary.\
In summary, using $monitor in an initial block is the typical and recommended approach, while wrapping it in always @ is redundant and not necessary.\

# MUX_4x1

```verilog
always @ (a or b or c or d or s0, s1)
begin
    case (s0 | s1)
        2'b00 : out <= a;
        2'b01 : out <= b;
        2'b10 : out <= c;
        2'b11 : out <= d;
    endcase
end
```

# Primitive 
emne chara kaj kore na 
```verilog
primitive UDP (D, a, b, c);
    output D;
    input a, b, c;

    table
        // inputs : output;
        0 0 0 : 1;
        0 0 1 : 0;
        0 1 0 : 1;
        0 1 1 : 0;
        1 0 0 : 1;
        1 0 1 : 0;
        1 1 0 : 1;
        1 1 1 : 1;
    endtable

endprimitive
```

# Output
```verilog
	initial
	begin 
		$dumpfile("binary_adder.vcd");
		$dumpvars(0,t_binary_adder);
		A = 4'b1001; B = 4'b0111; C_in =1'b1;
	end
	initial #250 $finish;
  ```