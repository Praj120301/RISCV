`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.06.2025 20:22:26
// Design Name: 
// Module Name: control_unit
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


module control_unit(input logic clk,
                    input logic reset,
                    input logic [6:0] opcode,
                    input logic [2:0] funct3,
                    input logic funct7_5,
                    input logic zero,
                    output logic pc_reset,
                    output logic pc_write,
                    output logic mem_write,
                    output logic ir_write,
                    output logic reg_write,
                    output logic [4:0] alu_control,
                    output logic adr_src,
                    output logic [1:0] result_src,
                    output logic [1:0] ALUsrcA,
                    output logic [1:0] ALUsrcB,
                    output logic [1:0] immsrc
                    );
                    logic [1:0] alu_op;
                    logic branch;
                    logic pc_update;
                     main_fsm main_fsm_inst(.clk(clk),
                              .reset(reset),
                              .opcode(opcode),
                              .pc_reset(pc_reset),
                              .branch(branch),
                              .pc_update(pc_update),
                              .mem_write(mem_write),
                              .ir_write(ir_write),
                              .reg_write(reg_write),
                              .alu_op(alu_op),
                              .adr_src(adr_src),
                              .result_src(result_src),
                              .ALUsrcA(ALUsrcA),
                              .ALUsrcB(ALUsrcB)
                               );                                                            
                      alu_decoder alu_decoder_inst(.alu_op(alu_op),.funct3(funct3),.op5(opcode[5]),.funct7_5(funct7_5),.alu_control(alu_control));
                      immediate_src immediate_src_inst(.opcode(opcode),.immsrc(immsrc));
                      assign pc_write=((branch&zero)|pc_update);
                      
endmodule
