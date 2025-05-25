`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.05.2025 22:44:40
// Design Name: 
// Module Name: regfile_tb
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


module regfile_tb();
    localparam data_width=32;
    localparam addr_width=5;
    
    logic clk,we;
    logic [addr_width-1:0] read_addr1,read_addr2,write_addr;
    logic [data_width-1:0] write_data;
    logic [data_width-1:0] read_data1,read_data2;
    
    regfile #(.data_width(data_width),.addr_width(addr_width)) dut (.*);
    initial clk = 0;
    always #5 clk = ~clk;
    
    initial begin
        we=0;
        read_addr1=0;
        read_addr2=0;
        write_addr=2;
        write_data=27;
        
        @(negedge clk)
        we=1;
        @(negedge clk)
        we=0;
        read_addr1=2;
        @(negedge clk)
        read_addr1=0;
    end
endmodule
