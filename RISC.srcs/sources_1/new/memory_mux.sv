`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.05.2025 15:50:23
// Design Name: 
// Module Name: memory_mux_2x1
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


module memory_mux_2x1(input logic [6:0] a,  
                      input logic [31:0] b,
                      input logic sel,
                      output logic [6:0]out
                      );
                      
                      always_comb begin
                        case(sel)
                        1'b0:out=a;
                        1'b1:out=b[6:0];
                        default:out=7'b0;
                        endcase
                      end
endmodule
