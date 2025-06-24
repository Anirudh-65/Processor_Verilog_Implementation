`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.04.2025 19:52:46
// Design Name: 
// Module Name: Processor_tb2
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


module Processor_tb2();
reg clk;
reg rst;

// Instantiate Processor
Processor uut(
    .clk(clk),
    .rst(rst)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin

     uut.reg_file.memo[0] = 8'd1;         // R0 = 1 (Decimal)
    // User-provided values
    uut.reg_file.memo[1] = 8'd5;         // R1 = 5 (Decimal)
    uut.reg_file.memo[2] = 8'd10;        // R2 = 10 (Decimal)
    uut.reg_file.memo[3] = 8'd3;         // R3 = 3 (Decimal)
    uut.reg_file.memo[4] = 8'd200;         // R4 = 2 (Decimal)
    uut.reg_file.memo[5] = 8'd19;        // R5 = 19 (Decimal)
    uut.reg_file.memo[6] = 8'd10;        // R6 = 10 (Decimal)
    uut.reg_file.memo[7] = 8'b10101010;  // R7 = 170 (Decimal) or AA (Hex)
    uut.reg_file.memo[8] = 8'b01010101;  // R8 = 85 (Decimal) or 55 (Hex)
    uut.reg_file.memo[9] = 8'd10;         // R9 = 0
    uut.reg_file.memo[10] = 8'd04;        // R10 = 0
    uut.reg_file.memo[11] = 8'd20;        // R11 = 0
    uut.reg_file.memo[12] = 8'd40;        // R12 = 0
    uut.reg_file.memo[13] = 8'd26;        // R13 = 0
    uut.reg_file.memo[14] = 8'd19;        // R14 = 0
    uut.reg_file.memo[15] = 8'd16;        // R15 = 0

end



// Instruction Memory Initialization
initial begin
    // Sample program
    // opcode format: 8'b[OPCODE][REG]
    uut.inst_mem.memory[0] = 8'b0000_0000;
    uut.inst_mem.memory[1] = 8'b0001_0001;
    uut.inst_mem.memory[2] = 8'b0010_0010;
    uut.inst_mem.memory[3] = 8'b0011_0011;
    uut.inst_mem.memory[4] = 8'b0101_0100;
    uut.inst_mem.memory[5] = 8'b0110_0101;
    uut.inst_mem.memory[6] = 8'b0111_0110;
    uut.inst_mem.memory[7] = 8'b0000_0001; 
    uut.inst_mem.memory[8] = 8'b0000_0010; 
    uut.inst_mem.memory[9] = 8'b0000_0011; 
    uut.inst_mem.memory[10] = 8'b0000_0100;
    uut.inst_mem.memory[11] = 8'b0000_0101;
    uut.inst_mem.memory[12] = 8'b0000_0110;
    uut.inst_mem.memory[13] = 8'b0000_0111;
    uut.inst_mem.memory[14] = 8'b1000_0010;
    uut.inst_mem.memory[15] = 8'b1111_1111;
end



// Test sequence
initial begin
   
    rst = 1;
    #10;
    rst = 0;

    // Run long enough to simulate full program
    #1000;
end

endmodule