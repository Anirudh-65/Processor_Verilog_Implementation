# Processor Architecture – Design Explanation

This document provides a breakdown of the architectural design, module integration, and synthesis overview of our custom processor.

---

##  System Architecture

Our processor is built using modular Verilog components that together emulate a basic processing unit capable of instruction execution and memory manipulation. The design was implemented and integrated in Vivado using a structural approach.

### Main Components

- **Instruction Memory**: Stores the instruction set to be executed.
- **Program Counter (PC)**: Generates sequential addresses for instruction fetch.
- **Control Unit**: Decodes the opcode and generates control signals.
- **Register File**: Houses general-purpose registers for operand and result storage.
- **ALU**: Executes arithmetic and logic operations based on control signals.
- **Data Memory**: Used for load/store operations.
- **Multiplexers & Adders**: Support data flow control and address computation.

Each module was first designed independently and then connected via a top-level wrapper that forms the complete datapath.

---

## Integration Flow

1. Each module was unit-tested with custom testbenches.
2. A hierarchical design was followed for top-level integration.
3. Simulation and waveform analysis were performed to confirm functional correctness.
4. Post-simulation, synthesis was performed in Vivado to generate a physical schematic.

---

##  Design Highlights

- Fully modular, extensible architecture
- Instruction-level simulation verified
- Synthesis completed with no timing violations
- Clean and testable top-level integration

---
