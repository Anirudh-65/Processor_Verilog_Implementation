`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.04.2025 15:59:29
// Design Name: 
// Module Name: Processor_tb
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


module Processor_tb();
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

    // Initialize remaining registers (R9 to R15) - often useful to set to 0
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
    uut.inst_mem.memory[0] = 8'b1001_0001;  // ADD R1       -> ACC = ACC + R1
    uut.inst_mem.memory[1] = 8'b0001_0010;  // SUB R2       -> ACC = ACC - R2
    uut.inst_mem.memory[2] = 8'b0010_0011;  // MOV ACC, R3  -> ACC = R3
    uut.inst_mem.memory[3] = 8'b0011_0100;  // MOV R4, ACC  -> R4 = ACC
    uut.inst_mem.memory[4] = 8'b1000_0011;  // XRA R5       -> ACC ^= R5
    uut.inst_mem.memory[5] = 8'b1111_1111;  // BR R9        -> if CB = 1, jump to R9
    uut.inst_mem.memory[6] = 8'b0000_0000;  // HLT          -> Stop execution
    uut.inst_mem.memory[7] = 8'b0000_0000; 
    uut.inst_mem.memory[8] = 8'b0000_0000; 
    uut.inst_mem.memory[9] = 8'b0000_0000; 
    uut.inst_mem.memory[10] = 8'b0000_0000;
    uut.inst_mem.memory[11] = 8'b0000_0000;
    uut.inst_mem.memory[12] = 8'b0000_0000;
    uut.inst_mem.memory[13] = 8'b0000_0000;
    uut.inst_mem.memory[14] = 8'b0000_0000;
    uut.inst_mem.memory[15] = 8'b0000_0000;
end  
    
// Test sequence
initial begin
    $display("Starting Tiny Processor Testbench");
    rst = 1;
    #10;
    rst = 0;

    // Run long enough to simulate full program
    #1000;
    $display("\nFinal Register File:");
    for (integer i = 0; i < 16; i=i+1) begin
        $display("R%0d = %0d", i, uut.reg_file.memo[i]);
    end
    $display("ACC = %0d", uut.acc);
    $display("EXT = %0d", uut.ext);
    $display("CB  = %0b", uut.cb);
    $finish;
end

endmodule
