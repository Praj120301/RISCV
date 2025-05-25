`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.05.2025 21:45:08
// Design Name: 
// Module Name: mux_3x1_nbit
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


module mux_3x1_nbit #(parameter n=32)
                     (input logic [n-1:0] in0,
                      input logic [n-1:0] in1,
                      input logic [n-1:0] in2,
                      input logic [1:0] select,
                      output logic [n-1:0] out1);
                      
       always_comb begin
            case({select})
            2'b00:  out1=in0;
            2'b01:  out1=in1;
            2'b10:  out1=in2;
            default: out1=2'bxx;
            endcase
       end
endmodule
