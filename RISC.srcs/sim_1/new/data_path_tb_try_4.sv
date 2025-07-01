`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.06.2025 18:06:36
// Design Name: 
// Module Name: data_path_tb_try_4
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


module data_path_tb_try_4();
logic clk;
logic pc_reset;
logic pc_write;//control
logic mem_write;//control
logic ir_write;//control
logic reg_write;//control,
logic [1:0] immsrc;//control
logic [4:0] alu_control;//control
logic adr_src;//control
logic [1:0] result_src;//control
logic [1:0] ALUsrcB;//control
logic [1:0] ALUsrcA;//control

data_path dut4(.*);

initial 
begin
    clk=1'b0;
end

always #5 clk = ~clk;
initial 
begin
    #150;
    $finish;
end


initial
begin
    pc_reset=1'b1;
    @(posedge clk);//5 ns 
    pc_reset=1'b0;
    @(posedge clk);//15 ns fetch
        adr_src=1'b0;
        ir_write=1'b1;
        ALUsrcA=2'b00;
        ALUsrcB=2'b10;
        alu_control=5'b00010;
        result_src=2'b10;
        
    @(posedge clk);//25ns decode
        ir_write=1'b0;
        pc_write=1'b1;//write to pc on memadr state
      
        immsrc=2'b00;
    @(posedge clk);//35 ns exec or memory addr
        pc_write=1'b0;
        ALUsrcA=2'b10;
        ALUsrcB=2'b01;
        alu_control=5'b00010;
     @(posedge clk);//45 mem read
        result_src=2'b00;
        adr_src=1'b1;
     @(posedge clk);
        result_src=2'b01;//55 memwb
        reg_write=1'b1;
     @(posedge clk)// new fetch 65 for store 0x00722423 sw x7,8(x4)
        reg_write=1'b0;
        adr_src=1'b0;
        ir_write=1'b1;
        ALUsrcA=2'b00;
        ALUsrcB=2'b10;
        alu_control=5'b00010;
        result_src=2'b10;
     @(posedge clk) //75decode
        pc_write=1'b1;//update next value of pc
        ir_write=1'b1;
        immsrc=2'b01;
     @(posedge clk) //85 mem adr,exec
        pc_write=1'b0;
        ir_write=1'b0;
        ALUsrcA=2'b10;
        ALUsrcB=2'b01;
        alu_control=5'b00010;
     @(posedge clk)//95-105 memwrite
        result_src=2'b00;
        adr_src=1'b1;
        mem_write=1'b1;
     @(posedge clk)//105-115j7u
        mem_write=1'b0;   
        adr_src=1'b0;
end

endmodule
