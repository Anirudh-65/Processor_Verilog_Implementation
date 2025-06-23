`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.04.2025 13:37:37
// Design Name: 
// Module Name: shifter
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


module shifter(D, clk, Q, mode);
    parameter n = 8;
    input [n-1:0] D;
    input clk;
    input [3:0] mode;
    output reg [n-1:0] Q;

    integer k;

    // Mode parameters
    parameter logical_right     = 4'b0010;
    parameter arithematic_right = 4'b0101;
    parameter circular_left     = 4'b0100;
    parameter circular_right    = 4'b0011;
    parameter logical_left      = 4'b0001;

    always @(posedge clk)
    begin
        case (mode)
            logical_right:
            begin
                for (k = 0; k < n-1; k = k + 1)
                    Q[k] <= Q[k+1];
                Q[n-1] <= 1'b0; // fill MSB with 0
            end

            arithematic_right:
            begin
                for (k = 0; k < n-1; k = k + 1)
                    Q[k] <= Q[k+1];
                Q[n-1] <= Q[n-1]; // preserve MSB
            end

            circular_left:
            begin
                for (k = n-1; k > 0; k = k - 1)
                    Q[k] <= Q[k-1];
                Q[0] <= Q[n-1]; // wrap MSB to LSB
            end

            circular_right:
            begin
                for (k = 0; k < n-1; k = k + 1)
                    Q[k] <= Q[k+1];
                Q[n-1] <= Q[0]; // wrap LSB to MSB
            end

            logical_left:
            begin
                for (k = n-1; k > 0; k = k - 1)
                    Q[k] <= Q[k-1];
                Q[0] <= 1'b0; // fill LSB with 0
            end

            default:
                Q <= D; // load new data if mode is unknown
        endcase
    end
endmodule

    
    
