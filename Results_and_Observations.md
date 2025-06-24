# Simulation Results & Observations

This document summarizes the simulation behavior, results, and observations for the custom processor. The simulation was executed using Vivado’s waveform viewer.

---

## Simulation Setup

The instruction memory was programmed with a set of assembly-level operations including:

- Arithmetic operations (ADD, SUB, MUL, etc.)
- Register-to-register data transfers
- Memory load/store operations
- Conditional branching

The processor’s response was validated via waveform inspection in Vivado.

---

##  Functional Results

- **Instruction Fetch and Decode**: Instructions were correctly fetched using PC and decoded by the control unit.
- **Register Operations**: Register file updates reflected correct read/write operations.
- **ALU Execution**: Outputs were verified for multiple ALU operations.
- **Memory Handling**: Data load and store instructions performed as intended.
- **Output Validity**: Final values in destination registers and memory matched expected outcomes.

---

##  Final Insights

The processor passed all test scenarios and exhibited correct control and datapath behavior. Observing the waveform closely helped us validate each stage of execution and debug minor signal mismatches early. The overall project reinforced practical understanding of RTL modeling, module interfacing, and verification through simulation.

---
