`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.04.2025 17:26:49
// Design Name: 
// Module Name: instruction_memory
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module instruction_memory(
    input [3:0] address,         // 4-bit address from PC
    output reg [7:0] instruct    // 8-bit instruction output
);

    // Declare 16-byte instruction memory
    reg [7:0] memory [0:15];

    // Initialize memory with a sample program
    initial begin
        memory[0] = 8'b0000_0000; // NOP      
        memory[1] = 8'b0001_0001; // ADD R1   
        memory[2] = 8'b0010_0010; // SUB R2   
        memory[3] = 8'b0011_0011; // MUL R3
        memory[4] = 8'b0101_0100; // AND R4   
        memory[5] = 8'b0110_0101; // XRA R5  
        memory[6] = 8'b0111_0110; // CMP R6
        memory[7] = 8'b0000_0001; // LSL ACC  
        memory[8] = 8'b0000_0010; // LSR ACC  
        memory[9] = 8'b0000_0011; // CIR ACC  
        memory[10] = 8'b0000_0100; // CIL ACC
        memory[11] = 8'b0000_0101; // ASR ACC
        memory[12] = 8'b0000_0110; // INC ACC 
        memory[13] = 8'b0000_0111; // DEC ACC 
        memory[14] = 8'b1000_0010; // Br 12   
        memory[15] = 8'b1111_1111; // HLT     
    end

    // Output instruction at the given address
    always @(*) begin
        instruct = memory[address];
    end

endmodule
