`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.04.2025 15:41:30
// Design Name: 
// Module Name: program_counter
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


module program_counter(
    input clk,
    input rst,
    input load,
    input [3:0] pc_in,
    output reg [3:0] pc_out
);
    always @(posedge clk or posedge rst) begin
        if (rst)
            pc_out <= 4'b0000;
        else if (load)
            pc_out <= pc_in;
        else
            pc_out <= pc_out + 1;
    end
endmodule
