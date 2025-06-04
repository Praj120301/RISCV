`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.05.2025 02:01:07
// Design Name: 
// Module Name: data_path_tb_try_2
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


module data_path_tb_try_2();
                 logic clk;
                 logic pc_reset;
                 logic pc_write;
                 logic mem_write;
                 logic ir_write;
                 logic reg_write;
                 logic [1:0] immsrc;
                 logic [4:0] alu_control;
                 logic adr_src;
                 logic [1:0] result_src;
                 
                  data_path dut1 (.*);
                  initial
                      begin clk=1'b0;
                  end
                      always #5 clk = ~clk;
                  initial 
                  begin
                      #100;
                      $finish;
                  end
                 
                  initial begin
                  pc_reset=1'b1;
                  @(negedge  clk);//fetch//10
                  pc_reset=1'b0;
                  ir_write=1'b1;
                  adr_src=0;
                  immsrc=2'b00;
                  @(negedge clk);//do nothing decode//20
                  ir_write=1'b0;
                  
                  @(negedge clk);//mem addr or reg read//exec//30
                  
                  alu_control=5'b00010;
                  @(negedge clk);//40
                  result_src=2'b00;
                  adr_src=1;
                  @(negedge  clk);//write back//50
                  result_src=2'b01;
                  reg_write=1'b1;
                  @(negedge clk)
                  reg_write=1'b0;
                  end
                 
endmodule
