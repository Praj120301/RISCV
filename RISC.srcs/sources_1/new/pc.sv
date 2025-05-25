`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.05.2025 21:08:57
// Design Name: 
// Module Name: pc
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


module pc #(parameter n=32)
                            ( input logic clk,
                             input logic reset,
                             input logic enable,
                             input logic  [n-1:0] d,
                             output logic [6:0] q);//data memory only takes seven bites we will clip the incoming data
                             logic [6:0] qreg,qnext;
                             always_ff @(posedge clk,posedge reset)//async reset
                             begin
                                if(reset)
                                begin
                                    qreg<='b0;
                                    
                                end
                                else
                                if(enable)
                                begin
                                    qreg<=qnext;
                                end                               
                                
                             end
                             
                             always_comb
                             begin
                                qnext=d[6:0];//if memory is bigger dont clip
                             end
                             
                             assign q=qreg;
endmodule
