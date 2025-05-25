`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.05.2025 15:20:22
// Design Name: 
// Module Name: n_bit_alu_tb
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


module n_bit_alu_tb();
        parameter n=4;
        logic [n-1:0] a;
        logic [n-1:0] b;
        logic cin;
        logic ainv;
        logic binv;
        logic [1:0] select;
        logic [n-1:0]result;
        logic cout;
        logic zero;
        logic overflow;
        logic negative;
        logic greater;
       
        n_bit_alu #(.n(n)) dut (.*);
        initial
        begin
           #100 $finish;
        end
        
        initial 
        begin
            a=5;
            b=5;
            cin=1;
            ainv=0;
            binv=1;
            select=2'b10;
            
            #10
            b=4;
            binv=1;
            cin=1;
            select=2'b11;
            
        end
                            
endmodule
