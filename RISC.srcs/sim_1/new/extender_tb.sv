`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.05.2025 23:14:56
// Design Name: 
// Module Name: extender_tb
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


module extender_tb();
    logic [31:7] instr;
    logic [1:0] immsrc;
    logic [31:0] immnext;
    
    extender dut(.*);
           initial begin
           
    
        
            instr = 25'b1111111111000100101000110;
            immsrc  = 2'b00;      //I type 
            #10;
    
        
            instr   = 25'b0000000001100100101001000;
            immsrc  = 2'b01;      
            #10;
    
            #10;
            $finish;
        end
    
    endmodule