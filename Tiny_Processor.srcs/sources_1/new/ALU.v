`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.04.2025 19:57:08
// Design Name: 
// Module Name: ALU
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

module ALU(opcode, acc, data_reg, clk, acc_out, ext, cb);

input [7:0] opcode;
input [7:0] acc, data_reg;
input clk;
output reg [7:0] acc_out, ext;
output reg cb;

wire [7:0] add_res, sub_res, and_res, xra_res, shift_res, mul_lower, mul_upper, inc_res, dec_res;
wire add_c, sub_b, comp, inc_c, dec_b;

adder ADD(acc, data_reg, add_res, add_c);
subtractor SUB(acc, data_reg, sub_res, sub_b);
assign and_res = acc & data_reg;
assign xra_res = acc ^ data_reg;
shifter SHIFT(acc, clk, shift_res, opcode[3:0]);
comparator COMP(acc, data_reg, comp);
multiplier MUL(acc, data_reg, {mul_upper, mul_lower});
adder inc(acc, 1, inc_res, inc_c);
subtractor dec(acc, 1, dec_res, dec_b);


always @(*)
begin
    acc_out = 8'b0;
    ext = 8'b0;
    cb = 1'b0;
    casez (opcode)
        8'b0001_????: 
        begin
            acc_out = add_res;
            cb = add_c;
        end
        8'b0010_????: 
        begin
            acc_out = sub_res;
            cb = sub_b;
        end
        8'b0011_????:
        begin
            acc_out = mul_lower;
            ext = mul_upper;
        end
        8'b0000_0001:
        begin
            acc_out = shift_res;
        end
        8'b0000_0010:
        begin
            acc_out = shift_res;
        end
        8'b0000_0011:
        begin
            acc_out = shift_res;
        end
        8'b0000_0100:
        begin
            acc_out = shift_res;
        end
        8'b0000_0101:
        begin
            acc_out = shift_res;
        end
        8'b0101_????:
        begin
            acc_out = and_res;
        end   
        8'b0110_????:
        begin
            acc_out = xra_res;
        end   
        8'b0111_????:
        begin
            acc_out = comp;
        end               
        8'b0000_0110:
        begin
            acc_out = inc_res;
            cb = inc_c;
        end               
        8'b0000_0111:
        begin
            acc_out = dec_res;
            cb = dec_b;
        end               
        default: 
        begin
            acc_out = acc;
        end
    endcase
end
endmodule