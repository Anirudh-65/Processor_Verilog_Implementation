`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.04.2025 14:33:58
// Design Name: 
// Module Name: ALU_tb
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

module ALU_tb();

reg [7:0] opcode;
reg [7:0] acc;
reg [7:0] data_reg;
reg clk;
wire [7:0] acc_out;
wire [7:0] ext;
wire cb;

// Instantiate the ALU
ALU uut (
    .opcode(opcode),
    .acc(acc),
    .data_reg(data_reg),
    .clk(clk),
    .acc_out(acc_out),
    .ext(ext),
    .cb(cb)
);

initial begin
clk = 0;
forever #10 clk=~clk;
end

initial begin
    $display("Starting ALU Testbench...");
    $monitor("Time=%0t | opcode=%b | acc=%d | data_reg=%d | acc_out=%d | ext=%d | cb=%b", 
             $time, opcode, acc, data_reg, acc_out, ext, cb);

    // ADD
    acc = 8'd10; data_reg = 8'd15; opcode = 8'b0001_0000; #10;

    // SUB
    acc = 8'd30; data_reg = 8'd12; opcode = 8'b0010_0000; #10;

    // MUL
    acc = 8'd7; data_reg = 8'd6; opcode = 8'b0011_0000; #10;

    // AND
    acc = 8'b11001100; data_reg = 8'b10101010; opcode = 8'b0101_0000; #10;

    // XOR
    acc = 8'b11001100; data_reg = 8'b10101010; opcode = 8'b0110_0000; #10;

    // CMP
    acc = 8'd50; data_reg = 8'd100; opcode = 8'b0111_0000; #10;

    // INC
    acc = 8'd200; data_reg = 8'd0; opcode = 8'b0000_0110; #10;

    // DEC
    acc = 8'd100; data_reg = 8'd0; opcode = 8'b0000_0111; #10;

    // LSL
    acc = 8'b00001111; data_reg = 8'b0; opcode = 8'b0000_0001; #10;

    // LSR
    acc = 8'b11110000; data_reg = 8'b0; opcode = 8'b0000_0010; #10;

    $finish;
end

endmodule

