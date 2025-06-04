`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.05.2025 01:13:15
// Design Name: 
// Module Name: data_path_tb_try3
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


module data_path_tb_try3();
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
logic [1:0] ALUsrcA;
logic [1:0] ALUsrcB;
 
data_path dut3(.*);
initial
begin clk=1'b0;
end
always #5 clk = ~clk;
initial 
begin
#100;
$finish;
end
//vectors
initial
begin
pc_reset=1'b1;
@(posedge clk);// 5ns
pc_reset=1'b0;
@(posedge clk);//15-25ns fetch
adr_src=1'b0;
ir_write=1'b1;
@(posedge clk);//25-35 decode
ir_write=1'b0;
immsrc=2'b00;
@(posedge clk);//35-45 mem_adr calculate mem adr or exec state
ALUsrcA=2'b10;
ALUsrcB=2'b01;
alu_control=5'b00010;
@(posedge clk);//45-55 mem read state at 55 data_out should have the data from instr/data mem
result_src=2'b00;
adr_src=1'b1;
@(posedge clk);//55-65 memwb or regwrite
result_src=2'b01;
reg_write=1'b1;
@(posedge clk);//65-55
reg_write=1'b0;
end

endmodule
