`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.05.2025 11:58:50
// Design Name: 
// Module Name: Areg
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


module Areg(input logic clk,
            input logic [31:0] d_a,
            input logic [31:0] d_b,
            output logic [31:0] q_a,
            output logic [31:0] q_b);
            
            logic [31:0]qreg_a,qnext_a;
            logic [31:0] qreg_b,qnext_b;
            always_ff@(posedge clk)
            begin
                qreg_a<=qnext_a;
                qreg_b<=qnext_b;
            end
            always_comb
            begin
                qnext_a=d_a;
                qnext_b=d_b;
                
            end
            assign q_a=qreg_a;
            assign q_b=qreg_b;
    
endmodule
