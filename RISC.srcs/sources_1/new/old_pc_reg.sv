`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.06.2025 01:02:44
// Design Name: 
// Module Name: old_pc_reg
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


module old_pc_reg(input logic clk,
                                        input logic enable,
                                        input logic [6:0] d,
                                        output logic [6:0] q  );
                                        
                                        logic [6:0] qreg,qnext;
                                        
                                        always_ff @(posedge clk)
                                        begin
                                            if(enable)
                                                  begin
                                                        qreg<=qnext;
                                                  end
                                        end
                                        
                                        always_comb
                                        begin
                                            qnext=d;
                                        end
                                        
                                        assign q=qreg;
endmodule
