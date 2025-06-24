`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.04.2025 16:29:17
// Design Name: 
// Module Name: memory
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


module memory(data_in, clk, data_out, address, write);

input [7:0]data_in;
input write;
input clk;
input [3:0]address;
output [7:0]data_out;
reg [7:0] memo [0:15];

assign data_out = memo[address];
always@(posedge clk)
begin
  if (write)
    memo[address] = data_in;
end
endmodule
