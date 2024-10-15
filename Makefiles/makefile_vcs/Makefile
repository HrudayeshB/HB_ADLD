# Use C shell if needed
SHELL = /bin/csh

# Default VCS flags
VCS_FLAGS = -v -Mupdate -Rpp -full64 -debug_acc+all

# Define the target
TARGET = output_file

# Get all design files except the last one (the testbench)
DESIGN_FILES := $(filter-out $(lastword $(MAKECMDGOALS)), $(MAKECMDGOALS))

# Get the last argument as the testbench file
TESTBENCH = $(lastword $(MAKECMDGOALS))

# Phony target for cleaning up
.PHONY: clean

# Default target: compile the design files and testbench
all: $(TARGET)

$(TARGET): $(DESIGN_FILES) $(TESTBENCH)
	@echo "Compiling design files and testbench..."
	vcs $(VCS_FLAGS) $(DESIGN_FILES) $(TESTBENCH)

# Clean up generated files
clean:
	@echo "Cleaning up..."
	rm -f $(TARGET) *.log *.vcd *.d *.o
