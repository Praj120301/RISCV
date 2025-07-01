`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.06.2025 22:07:15
// Design Name: 
// Module Name: data_path_tb_try5
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

module data_path_tb_try_5();
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

data_path dut5(.*);

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
    @(posedge clk);//5-15 reset state //used only  once
        pc_reset=1'b1;//as
    @(posedge clk);//15-25 fetch state 1 //used only once
        pc_reset=1'b0;
        adr_src=1'b0;//as
        ir_write=1'b1;//as
    @(posedge clk);//25-35  decode state
        pc_write=1'b0;
        ir_write=1'b0;
        immsrc=2'b00;
    @(posedge clk);//35-45 mem adr or exec
        ALUsrcA=2'b10;//as
        ALUsrcB=2'b01;//as
        alu_control=5'b00010;//as
     @(posedge clk);//45-55 mem read
        result_src=2'b00;//as
        adr_src=1'b1;//as
     @(posedge clk);//55-65 memwb or regrwrite
        result_src=2'b01;//as
        reg_write=1'b1;//as
     @(posedge clk);//65-75 pc add
        reg_write=1'b0;
        ALUsrcA=2'b00;//as
        ALUsrcB=2'b10;//as
        alu_control=5'b00010;//as
        result_src=2'b10;//as
     @(posedge clk);//75 -85 new fetch state 2   0x00722423 sw x7,8(x4)
        pc_write=1'b1;//as
        ir_write=1'b1;//as
        adr_src=1'b0;//as
     @(posedge clk);//new decode 85-95  
        pc_write=1'b0; 
        ir_write=1'b0;
        immsrc=2'b01;
     @(posedge clk);//new memadr or exec 95-105
        ALUsrcA=2'b10;//as
        ALUsrcB=2'b01;//as
        alu_control=5'b00010;//as
     @(posedge clk);//105-115 memwrite state
        result_src=2'b00;//as
        adr_src=1'b1;
        mem_write=1'b1;
     @(posedge clk);//115-125 pc add state
        mem_write=1'b0;
        ALUsrcA=2'b00;//as
        ALUsrcB=2'b10;//as
        alu_control=5'b00010;//as
        result_src=2'b10;//as
      @(posedge clk);//125-135 fetch 2  
        pc_write=1'b1;//as
        ir_write=1'b1;//as
        adr_src=1'b0;//as
       @(posedge clk);//135-145 decode
        ir_write=1'b0; 
        pc_write=1'b0;
end
endmodule