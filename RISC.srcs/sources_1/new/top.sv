`timescale 1ns / 1ps
/////////////////////////////////////////// ///////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.06.2025 20:53:23
// Design Name: 
// Module Name: top
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
////////////////////////////////////////// ////////////////////////////////////////


module top(
           input logic clk,
           input logic reset
           );           
          
           logic pc_reset;//control
           logic pc_write;//control
           logic mem_write;//control
           logic ir_write;//control
           logic reg_write;//control
           logic [1:0] immsrc;//control
           logic [4:0] alu_control;//control
           logic adr_src;//control
           logic [1:0] result_src;//control
           logic [1:0] ALUsrcA;//control
           logic [1:0] ALUsrcB;//control
           logic [6:0] opcode;//instr
           logic [2:0] funct3;//instr
           logic funt7_5;//instr
           control_unit control_unit_inst(
                                 .clk(clk),
                                 .reset(reset),
                                 .opcode(opcode),//instr
                                 .funct3(funct3),//instr
                                 .funct7_5(funt7_5),//instr
                                 .pc_reset(pc_reset),//control
                                 .pc_write(pc_write),//control
                                 .mem_write(mem_write),//control
                                 .ir_write(ir_write),//control
                                 .reg_write(reg_write),//control
                                 .alu_control(alu_control),//control
                                 .adr_src(adr_src),//control
                                 .result_src(result_src),//control
                                 .ALUsrcA(ALUsrcA),//control
                                 .ALUsrcB(ALUsrcB),//control
                                 .immsrc(immsrc)//control
                                  );
           data_path datapath_inst(
                                 .clk(clk),
                                 .pc_reset(pc_reset),//control
                                 .pc_write(pc_write),//control
                                 .mem_write(mem_write),//control
                                 .ir_write(ir_write),//control
                                 .reg_write(reg_write),//control,
                                 .immsrc(immsrc),//control
                                 .alu_control(alu_control),//control
                                 .adr_src(adr_src),//control
                                 .result_src(result_src),//control
                                 .ALUsrcB(ALUsrcB),//control
                                 .ALUsrcA(ALUsrcA),//control
                                 .opcode(opcode), //instr
                                 .funct3(funct3), //instr
                                 .funct7_5(funt7_5)//instr
                            );
           
         
           
endmodule
