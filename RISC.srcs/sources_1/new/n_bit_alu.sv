`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.05.2025 21:42:43
// Design Name: 
// Module Name: n_bit_alu
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


module  n_bit_alu #(parameter n=4)(
                 input logic [n-1:0] a,
                 input logic [n-1:0] b,
                 input logic cin,
                 input logic ainv,
                 input logic binv,
                 input logic [1:0] select,
                 output logic [n-1:0]result,
                 output logic cout,
                 output logic zero,
                 output logic overflow,
                 output logic negative,
                 output logic greater
                 );
                 logic c[n:0];
                 logic lessval;
                 assign c[0]=cin;
                 assign cout=c[n];
                         alu1bit a0(.a(a[0]),.b(b[0]),.less(lessval),.cin(c[0]),.ainv(ainv),.binv(binv),.select(select),.result(result[0]),.cout(c[1]));//first call
                 generate
                     genvar k;
                     for(k=1;k<n-1;k=k+1)
                     begin : stage 
                        alu1bit a1(.a(a[k]),.b(b[k]),.less(0),.cin(c[k]),.ainv(ainv),.binv(binv),.select(select),.result(result[k]),.cout(c[k+1]));
                        //assume n=32 then last iteration for this loop is k=30
                     end
                 endgenerate
                 alu1bit_lastbit a32 (.a(a[n-1]),.b(b[n-1]),.less(0),.cin(c[n-1]),.ainv(ainv),.binv(binv),.select(select),.result(result[n-1]),.cout(c[n]),.set(lessval));
                 //assume above line is for 31st bit
                 assign zero = ~|result;
                 assign overflow = (~c[n-1] & c[n])|(c[n-1] & ~c[n]);  //c[n-1] cin[n-1] and c[n] cout[n-1]   
                 assign negative=result[n-1];
//                 assign carryout=c[n];                 
               // assign greater=(~zero)&(~(negative^overflow));
               assign greater=((~result[n-1])&binv&cin&select[1]&(~select[0])&(~zero));
endmodule