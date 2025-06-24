`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.04.2025 14:41:08
// Design Name: 
// Module Name: subtractor
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


module subtractor(
    input [7:0] A,
    input [7:0] B,
    output [7:0] DIFF,
    output BORROW
);
    wire [7:0] B_complement;
    wire [7:0] temp_sum;
    wire carry;

    // Take 2's complement of B => ~B + 1
    assign B_complement = ~B;

    // Use the same adder to compute A + (~B + 1)
    adder ADDER(.A(A), .B(B_complement + 1'b1), .SUM(DIFF), .CARRY(carry));

    assign BORROW = ~carry;  // If carry is not generated, it was a borrow
endmodule

