`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.04.2025 12:43:32
// Design Name: 
// Module Name: instruction_memory_tb
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


module instruction_memory_tb();
reg [3:0] address;
wire [7:0] instruction;

// Instantiate the Instruction Memory
instruction_memory uut (.address(address), .instruct(instruction));

initial begin
    $display("Testing Instruction Memory...");
    $monitor("Address = %d => Instruction = %b", address, instruction);

    address = 4'd0; #10;
    address = 4'd1; #10;
    address = 4'd2; #10;
    address = 4'd3; #10;
    address = 4'd4; #10;
    address = 4'd5; #10;
    address = 4'd6; #10;
    address = 4'd15; #10;

    $finish;
end

endmodule

