`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.04.2025 19:59:59
// Design Name: 
// Module Name: accumulator
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


module accumulator(
    input clk,
    input rst,
    input acc_ld,
    input ext_ld,
    input cb_ld,
    input [7:0] acc_in,
    input [7:0] ext_in,
    input cb_in,
    output reg [7:0] acc,
    output reg [7:0] ext,
    output reg cb
);
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            acc <= 8'b0;
            ext <= 8'b0;
            cb  <= 1'b0;
        end else begin
            if (acc_ld) acc <= acc_in;
            if (ext_ld) ext <= ext_in;
            if (cb_ld)  cb  <= cb_in;
        end
    end
endmodule
