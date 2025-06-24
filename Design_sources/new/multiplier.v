`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.04.2025 14:43:45
// Design Name: 
// Module Name: multiplier
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


module multiplier (
    input [7:0] A, // Multiplicand
    input [7:0] B, // Multiplier
    output [15:0] P // Product
);

    // Generate partial products pp[i][j] = A[j] AND B[i]
    wire [7:0] pp [7:0];
    genvar i, j;
    generate
        for (i = 0; i < 8; i = i + 1) begin : gen_pp_rows
            for (j = 0; j < 8; j = j + 1) begin : gen_pp_bits
                assign pp[i][j] = A[j] & B[i];
            end
        end
    endgenerate

    // Shift partial products to align
    wire [15:0] pp_sh [7:0];
    genvar k;
    generate
        for (k = 0; k < 8; k = k + 1) begin : gen_shift
            assign pp_sh[k] = {{8{1'b0}}, pp[k]} << k;
        end
    endgenerate

    // Iteratively add shifted partial products using 8-bit adder module
    // sum_arr[0] = pp_sh[0]
    wire [15:0] sum_arr [7:0];
    wire carry_lo [7:0];
    wire carry_hi [7:0];

    assign sum_arr[0] = pp_sh[0];

    generate
        for (k = 1; k < 8; k = k + 1) begin : gen_add
            // Lower 8 bits addition
            adder add_lo (
                .A(sum_arr[k-1][7:0]),
                .B(pp_sh[k][7:0]),
                .SUM(sum_arr[k][7:0]),
                .CARRY(carry_lo[k])
            );
            // Upper 8 bits addition with carry
            adder add_hi (
                .A(sum_arr[k-1][15:8]),
                .B(pp_sh[k][15:8]),
                .SUM(sum_arr[k][15:8]),
                .CARRY(carry_hi[k])
            );
        end
    endgenerate

    // Final product is sum_arr[7]
    assign P = sum_arr[7];

endmodule
