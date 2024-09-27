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

wire - output purpose\
reg - input purpose (as we will test all possible inputs)
