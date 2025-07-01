`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.06.2025 10:44:41
// Design Name: 
// Module Name: alu_decoder
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


module alu_decoder(input logic [1:0] alu_op,
                   input logic [2:0] funct3,
                   input logic op5,funct7_5,
                   output logic [4:0] alu_control);
                   
                   always_comb begin
                   case(alu_op)
                      2'b00: alu_control=5'b00010;//add
                      2'b01: alu_control=5'b01110;//sub ainv=0,binv=1,cin=1,sel=10
                      2'b10: //pain
                             begin
                                case(funct3)
                                3'b000:if({op5,funct7_5}==2'b11)//may work for immediate r type insts or r type insts
                                            alu_control=5'b01110;//sub
                                        else 
                                            alu_control=5'b00010;//add
                                3'b110:     alu_control=5'b00001;//for or 
                                3'b111:     alu_control=5'b00000;//for and
                                3'b010:     alu_control=5'b01111;//for slt 
                                //3'100:     alu_control=;xor;
                                //3'b101//pain since 00,01,10,11 will be different
                                default:alu_control=5'bxxxxx;
                                endcase
                             end
                       default:alu_control=5'bxxxxx;
                   endcase
                   end
endmodule
