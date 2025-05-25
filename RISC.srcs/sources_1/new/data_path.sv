`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.05.2025 02:19:40
// Design Name: 
// Module Name: data_path
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


module data_path(input logic clk,
                 input logic pc_reset,
                 input logic pc_write,//control
                 input logic mem_write,//control
                 input logic ir_write,//control
                 input logic reg_write,//control,
                 input logic [1:0] immsrc,//control
                 input logic [4:0] alu_control,//control
                 input logic adr_src,//control
                 input logic [1:0] result_src
                 
                 );
                 logic [6:0]pc_out;
                 logic [6:0]mem_mux_out;
                 logic [31:0] mem_out;
                 logic [31:0] ir_in;
                 logic [31:0] instr;
                 logic [31:0] regout1;
                 logic [31:0] regout2; 
                 logic [31:0] a_out1;
                 logic [31:0] a_out2;
                 logic [31:0] immout;
                 logic [1:0] alu_select;
                 logic [31:0] alu_result;
                 logic [31:0] alu_out;
                 logic [31:0] data_out;
                 logic [31:0] result_out;
                 
                 assign alu_select = {alu_control[1],alu_control[0]};
                 assign ir_in=mem_out;
                 pc pc_ins(.clk(clk), .reset(pc_reset),.enable(pc_write), .d(),.q(pc_out));//correct
                 memory_mux_2x1 mem_mux_inst( .a(pc_out),.b(result_out),.sel(adr_src),.out(mem_mux_out));//correct
                 instr_data_mem instr_data_mem_inst(.clk(clk),.we(mem_write),.a(mem_mux_out),.wd(),.rd(mem_out));//correct
                 ir ir_inst (.clk(clk),.enable(ir_write),.d(ir_in),.q(instr));//corrrect
                 regfile regfile_inst(.clk(clk),.we(reg_write),.read_addr1(instr[19:15]),.read_addr2(),.write_addr(instr[11:7]),.write_data(result_out),.read_data1(regout1),.read_data2(regout2) );//correct
                 extender extender_inst(.instr(instr[31:7]),.immsrc(immsrc),.immnext(immout));//correct   
                 Areg areg_inst (.clk(clk),.d_a(regout1),.d_b(),.q_a(a_out1),.q_b());//correct
                 n_bit_alu #(.n(32)) alu_inst (.a(a_out1), .b(immout), .cin(alu_control[2]), .ainv(alu_control[4]), .binv(alu_control[3]), .select(alu_select), .result(alu_result), .cout(), .zero(), .overflow(), .negative(), .greater());//correct
                 n_bit_register alu_reg (.clk(clk),.d(alu_result),.q(alu_out));//correct
                 n_bit_register data_reg_inst (.clk(clk),.d(mem_out),.q(data_out));//correct
                 mux_3x1_nbit result_mux_inst(.in0(alu_out),.in1(data_out),.in2(),.select(result_src),.out1(result_out));//correct
                                 
endmodule
