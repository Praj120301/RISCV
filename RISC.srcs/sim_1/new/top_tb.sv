`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.06.2025 22:33:38
// Design Name: 
// Module Name: top_tb
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


module top_tb();

    logic clk;
    logic reset;
    top top_inst(.clk(clk),.reset(reset));   
    
    initial begin
        clk=1'b0;
    end   
    
    always #5 clk=~clk;     
    
    initial begin
        #225;
        $finish;
    end
    
    initial begin
//        reset=1'b0;
//        @(posedge clk) reset=1'b1;
//        #1 reset=1'b0;
    end
endmodule
