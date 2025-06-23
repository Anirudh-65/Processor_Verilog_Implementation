`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.04.2025 16:44:56
// Design Name: 
// Module Name: memory_tb
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


module memory_tb();

reg [7:0]data_in;
reg write, clk;
reg [3:0]address;

wire [7:0]data_out;

memory uut( .data_in(data_in) , .data_out(data_out) ,.clk(clk), .write(write) , .address(address));

initial begin
clk = 0;
forever #5
clk = ~ clk;
end 

initial begin
data_in  = 8'd11 ; write = 0 ; address = 4'd9; #10;
data_in  = 8'd19 ; write = 1 ; address = 4'd9; #10;
data_in  = 8'd29 ; write = 0 ; address = 4'd9; #10;
data_in  = 8'd01 ; write = 1 ; address = 4'd9; #10;
data_in  = 8'd29 ; write = 1 ; address = 4'd9; #10;
data_in  = 8'd9 ; write = 0 ; address = 4'd9;

end
endmodule
