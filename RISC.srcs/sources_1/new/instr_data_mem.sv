`timescale 1ns / 1ps

module instr_data_mem(input logic clk,
                      input logic we,
                      input logic [6:0] a,
                      input logic [31:0] wd,
                      output  logic [31:0] rd);
                      
                      logic [7:0] RAM [0:127];//byte addressable
                      
                      always_ff @(negedge clk)
                      begin
                        if(we)
                        begin
                            RAM[a]<=wd[7:0];
                            RAM[a+1]<=wd[15:8];
                            RAM[a+2]<=wd[23:16];
                            RAM[a+3]<=wd[31:24];
                        end
                        
                      end
                      always_comb
                      begin
                        rd={RAM[a+3],RAM[a+2],RAM[a+1],RAM[a]};
                      end
                      //lets initialise values
                      //little endian
                      initial begin
                            //lw x6, -5(x9) - I type   0xFFB4A303
                            RAM[0] = 8'h03;
                            RAM[1] = 8'hA3;
                            RAM[2] = 8'hB4;
                            RAM[3] = 8'hFF;
                            
                            //sw x7,4(x4)   - S type   0x00722223
                            RAM[4] = 8'h23;
                            RAM[5] = 8'h22;
                            RAM[6] = 8'h72;
                            RAM[7] = 8'h00;
                            
                            //the inst comes from reg file at location 8,and x5,x11,x12
                            //0x00c5f2b3
                            RAM[8]=8'h00;
                            RAM[9]=8'h00;
                            RAM[10]=8'h00;
                            RAM[11]=8'H00;
                            
                            //ori x18,x12,11 -I type ALU 0x00b64913
                            RAM[12]=8'h13;
                            RAM[13]=8'h69;
                            RAM[14]=8'hB6;
                            RAM[15]=8'h00;
                            
                            //beq x15,x18,-12 -B type ALU 0xFF278AE3
                            RAM[16]=8'HE3;
                            RAM[17]=8'H8A;
                            RAM[18]=8'H27;
                            RAM[19]=8'HFF;
                            //rest for now are zero
                      end
                      
endmodule
