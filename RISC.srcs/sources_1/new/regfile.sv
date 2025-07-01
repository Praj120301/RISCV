`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.05.2025 22:12:32
// Design Name: 
// Module Name: regfile
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


module regfile #(parameter data_width=32,addr_width=5) 
              (input logic clk,
              
               input logic we,
               input logic [addr_width-1:0] read_addr1,
               input logic [addr_width-1:0] read_addr2,
               input logic [addr_width-1:0] write_addr,
               input logic [data_width-1:0] write_data,
               output logic [data_width-1:0] read_data1,
               output logic [data_width-1:0] read_data2               
               );
               logic [31:0] mem[0:(2**addr_width)-1];
               always_ff @(negedge clk)
               begin
                 if(we)
                 begin
                    mem[write_addr]<=write_data;
                 end
               end
               
               assign read_data1=(read_addr1!=0)?mem[read_addr1]:0;
               assign read_data2=(read_addr2!=0)?mem[read_addr2]:0;
                   //just for cross checking
                   initial begin
                   mem[0]  = 32'd0;
                   mem[1]  = 32'd1;
                   mem[2]  = 32'd2;
                   mem[3]  = 32'd3;
                   mem[4]  = 32'd4;
                   mem[5]  = 32'd5;
                   mem[6]  = 32'd6;
                   mem[7]  = 32'b00000000110001011111001010110011;
                   mem[8]  = 32'd8;
                   mem[9]  = 32'd9;
                   mem[10] = 32'd10;
                   mem[11] = 32'd11;
                   mem[12] = 32'd12;
                   mem[13] = 32'd13;
                   mem[14] = 32'd14;
                   mem[15] = 32'd15;
                   mem[16] = 32'd16;
                   mem[17] = 32'd17;
                   mem[18] = 32'd18;
                   mem[19] = 32'd19;
                   mem[20] = 32'd20;
                   mem[21] = 32'd21;
                   mem[22] = 32'd22;
                   mem[23] = 32'd23;
                   mem[24] = 32'd24;
                   mem[25] = 32'd25;
                   mem[26] = 32'd26;
                   mem[27] = 32'd27;
                   mem[28] = 32'd28;
                   mem[29] = 32'd29;
                   mem[30] = 32'd30;
                   mem[31] = 32'd31;
                   end
endmodule
