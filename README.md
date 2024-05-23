# RISC Machine Design

## Overview
This project involves the design, synthesis, and simulation of an 8-bit Reduced Instruction Set Computing (RISC) processor using Verilog. The processor features a Harvard Architecture and includes various enhancements to handle data hazards and branch detection.

## Project Description
The RISC Processor Design project focuses on creating an efficient 8-bit RISC microcontroller with a comprehensive instruction set and advanced control mechanisms. The design follows the Harvard Architecture, allowing separate data and instruction memory, which improves throughput and performance. Key improvements include the implementation of data hazard stall mechanisms and branch detection logic to ensure accurate and efficient execution of instructions.

### Key Objectives
- Design an 8-bit RISC processor with Harvard Architecture.
- Implement a 32-instruction set for versatile processing capabilities.
- Develop data hazard stall and branch detection logic to enhance performance.
- Synthesize and simulate the processor using Xilinx Vivado.

## Key Features
- **8-bit RISC Processor:**
  - Designed using Behavioral Verilog.
  - Follows the Harvard Architecture for separate instruction and data memory.
- **Instruction Set:**
  - Supports 32 distinct instructions.
- **Data Hazard and Branch Detection:**
  - Implements logic to handle data hazards and prevent incorrect data writes.
- **Synthesis and Simulation:**
  - Synthesized and simulated using Xilinx Vivado.

## Technical Details
### Tools and Technologies
- **Languages:** Verilog
- **Design and Simulation Tool:** Xilinx Vivado

### Architecture
- **Harvard Architecture:** Separate data and instruction memories.
- **Instruction Set:** 32 instructions including arithmetic, logic, and control operations.
- **Control Logic:** Data hazard stall and branch detection mechanisms.

## Usage
1. **Clone the repository:**
   ```bash
   git clone https://github.com/saumyatshah/RISC-Machine-Design.git
2. **Open the project in Xilinx Vivado**
3. **Synthesize the design:**
-  Follow the steps in Vivado to synthesize the Verilog code.
4. **Simulate the design:**
-  Use Vivado's simulation tools to verify the functionality of the processor.
5. **Implement on FPGA (optional):**
-  Follow the steps in Vivado to generate a bitstream and program it onto a compatible FPGA board.

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
