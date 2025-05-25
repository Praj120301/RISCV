`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.05.2025 02:15:22
// Design Name: 
// Module Name: n_bit_register
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


module n_bit_register #(parameter n=32)
                            (input logic clk,
                            input logic [n-1:0]d,
                            output logic [n-1:0]q);
                            
                            logic [n-1:0]qreg,qnext;
                            
                            always_ff @(posedge clk)//async reset
                            begin
                                
                                    qreg<=qnext;
                                
                            end
                            
                            always_comb
                            begin
                               qnext=d;
                            end
                            
                            assign q=qreg;
                                                     
endmodule
