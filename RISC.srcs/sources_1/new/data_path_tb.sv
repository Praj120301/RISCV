`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.05.2025 02:58:13
// Design Name: 
// Module Name: data_path_tb
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


module data_path_tb();
                 logic clk;
                 logic pc_reset;
                 logic pc_write;
                 logic mem_write;
                 logic [31:0] instr_data_out;
                 logic ir_write;
                 logic reg_write;
                 logic [1:0] immsrc;
//                 logic [31:0] regout1;
                 logic [4:0] alu_control;
//                 logic [31:0] alu_out;
                 logic adr_src;
                 logic [1:0] result_src;
                 data_path dut(.*);
                 initial
                 begin clk=0;
                 end
                 
                 always #5 clk = ~clk;
                 
                 initial begin
                 #10
                    pc_reset=1;
                 #10
                    ir_write=1;
                    immsrc=2'b00;
                    adr_src=1'b0;
                  #10
                    alu_control=5'b00010;
                    ir_write=1'b0;
                  #10
                  
                  #10
                    adr_src=1'b1;
                    result_src=1'b00;
                   #10
                    adr_src=1'b0;
                    result_src=1'b01;
                    reg_write=1'b1;
                 end
endmodule
