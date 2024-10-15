# Define the directories
DESIGN_DIR = design
TB_DIR = testbench
OUTPUT_DIR = output

# Define the Verilog source files (modify according to your filenames)
DESIGN_FILES = $(wildcard $(DESIGN_DIR)/*.v)
TB_FILES = $(wildcard $(TB_DIR)/*.v)

# Define the simulation output file
VVP_OUTPUT = $(OUTPUT_DIR)/simulation.vvp
WAVEFORM_FILE = $(OUTPUT_DIR)/waveform.vcd

# Default target
all: run

# Compile the Verilog files using Icarus Verilog
compile: $(DESIGN_FILES) $(TB_FILES)
	@mkdir -p $(OUTPUT_DIR)
	iverilog -o $(VVP_OUTPUT) $(DESIGN_FILES) $(TB_FILES)

# Run the compiled simulation
run: compile
	vvp $(VVP_OUTPUT)
	mv waveform.vcd $(WAVEFORM_FILE)

# View the waveform using GTKWave
wave: $(WAVEFORM_FILE)
	gtkwave $(WAVEFORM_FILE)

# Clean generated files
clean:
	rm -rf $(OUTPUT_DIR)