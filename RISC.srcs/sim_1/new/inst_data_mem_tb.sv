`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.05.2025 17:33:12
// Design Name: 
// Module Name: inst_data_mem_tb
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


module inst_data_mem_tb();
                logic clk;
                logic we;
                logic [6:0] addr;
                logic [31:0] wd;//input into mem
                logic [31:0] rd;//output from mem
                instr_data_mem dut (.clk(clk),
                                    .we(we),
                                    .a(addr),
                                    .wd(wd),
                                    .rd(rd));
                
               always #5 clk = ~clk;
               
               initial begin
               
                    clk=0;
                    we=0;
                    addr=0;
                    wd=0;
                    
                    #10
                    addr=4;
                  
                    
                    #100
                    $finish;
                    
               end                                    
        
endmodule
