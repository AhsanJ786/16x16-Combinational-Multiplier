#compiler and simulator
IVERILOG = iverilog
VVP = vvp

# Directories and files for 4bit_counter
MULTIPLIER_VERILOG_FILES = src/Sign_multiplier.sv src/Half_adder.sv src/Full_adder.sv test/tb.sv
MULTIPLIER_OUTPUT_FILE = out.vvp

# Default target
all: mult

#Compile and simulate multiplier
mult: compile_mult simulate_mult

compile_mult:
	$(IVERILOG) -g2012 -o $(MULTIPLIER_OUTPUT_FILE) $(MULTIPLIER_VERILOG_FILES)

simulate_mult:
	$(VVP) $(MULTIPLIER_OUTPUT_FILE)

#Clean up generated files
clean:
	rm -f $(MULTIPLIER_OUTPUT_FILE)

.PHONY: all mult compile_mult simulate_mult clean

