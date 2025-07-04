`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.04.2025 14:34:56
// Design Name: 
// Module Name: adder
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


module adder(
    input [7:0] A,
    input [7:0] B,
    output [7:0] SUM,
    output CARRY
);
    wire [7:0] carry;

    full_adder FA0 (A[0], B[0], 1'b0, SUM[0], carry[0]);
    full_adder FA1 (A[1], B[1], carry[0], SUM[1], carry[1]);
    full_adder FA2 (A[2], B[2], carry[1], SUM[2], carry[2]);
    full_adder FA3 (A[3], B[3], carry[2], SUM[3], carry[3]);
    full_adder FA4 (A[4], B[4], carry[3], SUM[4], carry[4]);
    full_adder FA5 (A[5], B[5], carry[4], SUM[5], carry[5]);
    full_adder FA6 (A[6], B[6], carry[5], SUM[6], carry[6]);
    full_adder FA7 (A[7], B[7], carry[6], SUM[7], carry[7]);

    assign CARRY = carry[7];
endmodule
