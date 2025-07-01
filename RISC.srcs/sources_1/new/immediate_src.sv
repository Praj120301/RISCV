`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.06.2025 23:24:13
// Design Name: 
// Module Name: immediate_src
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


module immediate_src(input logic [6:0] opcode,
                     output logic [1:0] immsrc );
                     always_comb begin
                     case(opcode)
                        7'b0000011:immsrc=2'b00;//I type (load)
                        7'b0010011:immsrc=2'b00;//I type ALU
                        7'b0100011:immsrc=2'b01;//S type (store)
                        default:immsrc=2'bxx;
                     endcase
                     end
            
endmodule
