`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.04.2025 13:58:22
// Design Name: 
// Module Name: Processor
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

module Processor(input clk, input rst);
    wire [3:0] pc;
    wire [7:0] opcode;
    wire [3:0] add;
    wire [7:0] data_reg;
    wire [3:0] pc_next = pc + 1;

    reg pc_l;
    reg [3:0] pc_in;
    program_counter prct(
        .clk(clk),
        .rst(rst),
        .load(pc_l),
        .pc_in(pc_in),
        .pc_out(pc)
    );

    // Instruction Memory
    instruction_memory inst_mem(
        .address(pc),
        .instruct(opcode)
    );

    // Register File
    reg [7:0] data_in;
    reg write;
    memory reg_file(     
        .data_in(data_in),
        .data_out(data_reg),
        .address(add),
        .write(write)
    );

    // Registers: ACC, EXT, CB
    reg [7:0] acc;
    reg [7:0] ext;
    reg cb;
    reg acc_ld, ext_ld, cb_ld;

    // ALU outputs
    wire [7:0] alu_acc_out;
    wire [7:0] alu_ext_out;
    wire alu_cb_out;
    ALU alu(.opcode(opcode), .acc(acc), .data_reg(data_reg), .clk(clk), .acc_out(alu_acc_out), .ext(alu_ext_out), .cb(alu_cb_out));
    assign add = opcode[3:0];
    reg [7:0] acc_next_value; 
    
    // Combinational control logic
    always @(*) begin
        // Default values
        acc_ld = 0;
        ext_ld = 0;
        cb_ld  = 0;
        write  = 0;
        data_in = 8'h00;
        pc_l = 1;           // Default: enable PC update
        pc_in = pc_next;    // Default: increment PC
        acc_next_value = alu_acc_out; // Default source for ACC is ALU output

        casez (opcode)
            // NOP
            8'b0000_0000: ;                        
            // ADD
            8'b0001_????: begin acc_ld=1; cb_ld=1; end 
            // SUB
            8'b0010_????: begin acc_ld=1; cb_ld=1; end 
            // MUL
            8'b0011_????: begin acc_ld=1; ext_ld=1; end 
            // ASR
            8'b0000_0001,                     
            8'b0000_0010,                          
            8'b0000_0011,                          
            8'b0000_0100,                          
            8'b0000_0101: begin acc_ld=1; end
            // XRA         
            8'b0110_????: begin acc_ld=1; end    
            // CMP     
            8'b0111_????: begin cb_ld=1; end  
            // INC                                 
            8'b0000_0110: begin acc_ld=1; cb_ld=1; end 
            8'b0000_0111: begin acc_ld=1; cb_ld=1; end // DEC
            8'b0101_????: begin acc_ld=1; end         // AND
            8'b1000_????:                         // BR if CB
                if (cb) begin pc_l=1; pc_in=add;  end
            // --- FIX HERE ---
            8'b1001_????: begin                     // MOV ACC,Ri
                          acc_ld=1;
                          acc_next_value = data_reg; // Source for ACC is data_reg, not ALU output
                          end
            // --- END FIX ---
            8'b1010_????: begin write=1; data_in=acc; end                      // MOV Ri,ACC
            8'b1011_????: begin pc_l=1; pc_in=add; end                         // RET (Assuming RET is like JMP)
            8'b1111_1111: begin                   
                pc_l = 0; // Disable PC update
            end
            default: ; // Treat unrecognized opcodes as NOPs
        endcase
    end

    // Sequential state update
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            acc <= 8'b0;
            ext <= 8'b0;
            cb  <= 1'b0;
        end else begin
            // --- FIX HERE ---
            if (acc_ld) acc <= acc_next_value; // Load ACC from the selected source
            // --- END FIX ---
            if (ext_ld) ext <= alu_ext_out;
            if (cb_ld ) cb  <= alu_cb_out;
            // Note: Register file write happens inside the memory module, triggered by 'write' signal
        end
    end

endmodule


