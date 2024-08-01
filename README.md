# Signed Multiplier Module

This repository contains the implementation of a signed multiplier module in Verilog, along with a testbench for simulation.

# Signed Multiplier Module

This repository contains the implementation of a signed multiplier module in Verilog, along with a testbench for simulation.

## Directory Structure

Signed_Multiplier/
├── src/
│ ├── Full_adder.sv
│ ├── Half_adder.sv
│ ├── Sign_multiplier.sv
├── test/
│ ├── tb.sv
├── Makefile
└── README.md


## Files

- **src/Full_adder.sv**: Contains the Verilog code for the full adder module.
- **src/Half_adder.sv**: Contains the Verilog code for the half adder module.
- **src/Sign_multiplier.sv**: Contains the Verilog code for the signed multiplier module.
- **test/tb.sv**: Contains the testbench for simulating the signed multiplier module.
- **Makefile**: Makefile to compile and simulate the signed multiplier module.
- **README.md**: This README file.

## Prerequisites

To compile and simulate the Verilog code, you need to have the following tools installed:

- **Icarus Verilog**: An open-source Verilog simulation and synthesis tool.
- **VVP**: A program that executes the compiled Verilog code.

## Usage

### Compilation and Simulation

To compile and simulate the signed multiplier module, run the following command in the terminal:

```sh
make
```
### Cleanup
for cleanup
```
make clean
```
