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

##  Simulation Screenshots

Below are annotated waveform screenshots captured from Vivado to illustrate the processor’s behavior during simulation:

### 1. Instruction Fetch & PC Increment  
![Simulation Screenshot 1](assets/sim1.png)

### 2. ALU Operation (ADD/SUB) & Write-back  
![Simulation Screenshot 2](assets/sim2.png)

### 3. Load/Store Operations & Final Register Snapshot  
![Simulation Screenshot 3](assets/sim3.png)

> Place these screenshots as `sim1.png`, `sim2.png`, and `sim3.png` inside the `assets/` folder.

---

##  Final Insights

The processor passed all test scenarios and exhibited correct control and datapath behavior. Observing the waveform closely helped us validate each stage of execution and debug minor signal mismatches early. The overall project reinforced practical understanding of RTL modeling, module interfacing, and verification through simulation.

---
