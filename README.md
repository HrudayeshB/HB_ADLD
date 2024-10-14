# Advanced Digital Logic Design (ADLD)
This is my repo that stores all my assignments and some projects related to Digital logic design, These are verilog codes to be tested in the VCS - Synopsys software available in college PCs, I have written and tested in Icarus verilog and GTKwave.

# Verilog Simulation with Icarus Verilog and GTKWave

This guide explains how to install Icarus Verilog and GTKWave on Ubuntu, simulate Verilog designs, and view the resulting waveforms.

## 1. Installing Icarus Verilog

Icarus Verilog (`iverilog`) is a free, open-source Verilog simulation and synthesis tool.

### Steps to Install:

1. Update package lists:
    ```bash
    sudo apt update
    ```

2. Install Icarus Verilog:
    ```bash
    sudo apt install iverilog
    ```

3. Verify the installation:
    ```bash
    iverilog -v
    ```

## 2. Installing GTKWave

GTKWave is a waveform viewer used to visualize signal activity during simulations.

### Steps to Install:

1. Install GTKWave:
    ```bash
    sudo apt install gtkwave
    ```

2. Verify the installation:
    ```bash
    gtkwave --version
    ```

## 3. Running a Verilog Simulation

### Example Verilog Design and Testbench

1. **Create a Verilog file (`mux.v`)**:
    ```verilog
    module mux(
        input a, b, sel,
        output y
    );

	assign y = sel ? b : a;
   
    endmodule
    ```

2. **Create a testbench (`tb_name.v`)**:
    ```verilog
    module tb_name;
    reg a, b, sel;
    wire y;

	mux uut (a, b, sel, y);
    
    initial begin
        // Open a dump file for waveform output
        $dumpfile("waveform.vcd");
        $dumpvars(0, tb_name);
        
        // Initialize inputs
        a = 1; b = 0; sel = 0;
        #10 sel = 1;
        #10 sel = 0;

        // Run simulation for some time
        #10 $finish;
    end
    
    endmodule
    ```

### Compile and Simulate the Design

1. Compile the Verilog code and testbench:
    ```bash
    iverilog -o example_tb.vvp mux.v tb_name.v
    ```

2. Run the simulation:
    ```bash
    vvp tb_name.vvp
    ```

3. The simulation will generate a waveform file named `waveform.vcd`.

## 4. Viewing the Waveform with GTKWave

1. Open the waveform file in GTKWave:
    ```bash
    gtkwave waveform.vcd
    ```

2. In GTKWave, add the signals you want to view and analyze the waveform.

### Example Workflow Summary:

1. Write Verilog code and testbench (`mux.v` and `tb_name.v`) for design and testbench files.
2. Compile with Icarus Verilog using `iverilog` to generate the simulation file (`.vvp`).
3. Run the simulation with `vvp`, which generates the waveform file (`waveform.vcd`).
4. Open the waveform file using GTKWave to analyze the signals.

---

## Additional Information

- **Icarus Verilog Documentation**: [https://iverilog.fandom.com/wiki/Main_Page](https://iverilog.fandom.com/wiki/Main_Page)
- **GTKWave Documentation**: [http://gtkwave.sourceforge.net/](http://gtkwave.sourceforge.net/)

This guide helps you get started with simulating Verilog designs using Icarus Verilog and viewing the results with GTKWave.
