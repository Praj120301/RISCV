`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.05.2025 22:23:53
// Design Name: 
// Module Name: extender
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


module extender(input logic [31:7] instr,
                input logic [1:0] immsrc,
                output logic [31:0] immnext);
                
                always_comb
                begin
                    case({immsrc})
                        //I type
                        2'b00:immnext={{20{instr[31]}},instr[31:20]};
                        //S type
                        2'b01:immnext={{20{instr[31]}},instr[31:25],instr[11:7]};
                        //B type
                        2'b10:immnext={{20{instr[31]}},instr[7],instr[30:25],instr[11:8],1'b0};
                        // J type
                        2'b11:immnext={{12{instr[31]}},instr[19:12],instr[20],instr[30:21],1'b0};
                        default:immnext=32'bx;
                        
                    endcase
                end
endmodule
