`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.05.2025 21:23:19
// Design Name: 
// Module Name: mux_4x1
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

module mux_4x1(input logic x0,x1,x2,x3,s0,s1,
output logic f);
logic g0,g1;
mux_2x1 m1(.x1(x2),
                .x2(x3),
                .s(s0),
                .f(g1)
                 );
mux_2x1 mo(.x1(x0),
                .x2(x1),
                .s(s0),
                .f(g0)
                );//g0 output of mux1

mux_2x1 m2(.x1(g0),
                .x2(g1),
                .s(s1),
                .f(f)
                 );

endmodule