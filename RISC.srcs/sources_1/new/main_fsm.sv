`timescale 1ns / 1ps
module main_fsm(input logic clk,
                input logic reset,
                input logic [6:0] opcode,
                output logic pc_reset,
                output logic pc_write,
                output logic mem_write,
                output logic ir_write,
                output logic reg_write,
                output logic [1:0] alu_op,//remove later
                output logic adr_src,
                output logic [1:0] result_src,
                output logic [1:0] ALUsrcA,
                output logic [1:0] ALUsrcB
                
                );
                
                typedef enum {s_init,s0,s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s_error} state_nums;
                
                state_nums state_reg,state_next;
                //state reg logic
                always_ff@(posedge clk,posedge reset)//async reset
                begin
                    if(reset)
                        state_reg<=s_init;
                    else 
                        state_reg<=state_next;
                end
                //next state logic
                always_comb
                begin
                    case(state_reg)
                        s_init:state_next=s0;
                        s0://reset state
                            state_next=s1;//goes to fetch state
                        s1://fetch state
                            state_next=s2;
                        s2://decode
                           case({opcode})
                           7'b0000011:state_next=s3;//goes to mem_adr since load type instr
                           7'b0100011:state_next=s3;//goes to mem_adr for store as well
                           7'b0110011:state_next=s9;//goes to execute r
                           default:state_next=s_error;
                           endcase
                        s3://mem_adr
                           //put if when you need to figure out load word or store word
                           if(opcode[5])
                           state_next=s8;//suposed to go to memwrite,store
                           else
                           state_next=s4;//goes to mem_read ,load
                           
                        s4://mem_read
                           state_next=s5;//goes to mem_wb;
                        s5://mem_wb
                            state_next=s6;//goes to pc add
                        s6://pc_add
                            state_next=s7;//goes to fetch2
                        s7://fetch2
                            state_next=s2;//goes to decode
                        s8://mem_write
                            state_next=s6;//goes to pc add
                        s9://execute_R 
                             state_next=s10;
                           //alu_wb
                        s10: state_next=s_error;
                        default:state_next=state_reg;
                    endcase
                end
                //output logic
                always_comb
                begin
                    case(state_reg)
                    s_init:
                       begin
                           pc_reset=1'bx;
                           pc_write=1'bx;
                           mem_write=1'bx;
                           ir_write=1'bx;
                           reg_write=1'bx;
                           alu_op=2'bxx;
                           adr_src=1'bx;
                           result_src=2'bxx;
                           ALUsrcA=2'bxx;
                           ALUsrcB=2'bxx;
                            
                       end
                    s0://reset                                    5-15
                        begin
                            pc_reset=1'b1;
                            pc_write=1'b0;
                            mem_write=1'b0;
                            ir_write=1'b0;
                            reg_write=1'b0;
                            alu_op=2'bxx;
                            adr_src=1'b0;
                            result_src=2'b00;
                            ALUsrcA=2'b00;
                            ALUsrcB=2'b00;
//                            
                        end
                     s1://fetch1                                 15-25
                        begin
                            pc_reset=1'b0;
                            pc_write=1'b0;
                            mem_write=1'b0;
                            ir_write=1'b1;   //imp
                            reg_write=1'b0;
                            alu_op=2'bxx;
                            adr_src=1'b0;    //imp
                            result_src=2'b00;
                            ALUsrcA=2'b00;
                            ALUsrcB=2'b00;
//                            immsrc=2'b00;    //remove later
                        end
                     s2://decode                                 25-35
                        begin
                            pc_reset=1'b0;
                            pc_write=1'b0;
                            mem_write=1'b0;
                            ir_write=1'b0;
                            reg_write=1'b0;
                            alu_op=2'bxx;
                            adr_src=1'b0;
                            result_src=2'b00;
                            ALUsrcA=2'b00;
                            ALUsrcB=2'b00;
//                              
                        end
                      s3://mem_adr or exec                       35-45
                        begin
                            pc_reset=1'b0;
                            pc_write=1'b0;
                            mem_write=1'b0;
                            ir_write=1'b0;
                            reg_write=1'b0;
                            alu_op=2'b00;
                            adr_src=1'b0;
                            result_src=2'b00;  
                            ALUsrcA=2'b10;    //imp
                            ALUsrcB=2'b01;    //imp
//                           
                        end
                       s4://mem read                            45-55
                        begin
                            pc_reset=1'b0;
                            pc_write=1'b0;
                            mem_write=1'b0;
                            ir_write=1'b0;
                            reg_write=1'b0;
                            alu_op=2'b00;
                            adr_src=1'b1;         //imp
                            result_src=2'b00;     //imp
                            ALUsrcA=2'b10;
                            ALUsrcB=2'b01;
//                                                      
                        end
                        s5://mem wb                              55-65
                        begin
                            pc_reset=1'b0;
                            pc_write=1'b0;
                            mem_write=1'b0;
                            ir_write=1'b0;
                            reg_write=1'b1;         //imp
                            alu_op=2'b00;
                            adr_src=1'b0;
                            result_src=2'b01;       //imp
                            ALUsrcA=2'b10;
                            ALUsrcB=2'b01;
//                             
                        end
                        s6://pc_add                               65-75
                        begin
                            pc_reset=1'b0;
                            pc_write=1'b1;          //imp
                            mem_write=1'b0;
                            ir_write=1'b0;
                            reg_write=1'b0;
                            alu_op=2'b00;
                            adr_src=1'b0;
                            result_src=2'b10;       //imp
                            ALUsrcA=2'b00;          //imp
                            ALUsrcB=2'b10;          //imp
//                                          //remove later
                        end
                        s7://fetch2                               75-85
                        begin
                            pc_reset=1'b0;
                            pc_write=1'b1;          //imp
                            mem_write=1'b0;
                            ir_write=1'b1;          //imp
                            reg_write=1'b0;
                            alu_op=2'bxx;
                            adr_src=1'b0;
                            result_src=2'b00;
                            ALUsrcA=2'b10;
                            ALUsrcB=2'b01;
//                            
                        end
                        s8://mem write                              //115-125
                        begin
                            pc_reset=1'b0;
                            pc_write=1'b0;
                            mem_write=1'b1;           //imp
                            ir_write=1'b0;
                            reg_write=1'b0;
                            alu_op=2'b00;
                            adr_src=1'b1;             //imp
                            result_src=2'b00;         //imp
                            ALUsrcA=2'b10;
                            ALUsrcB=2'b01;
                        end
                        s9:                            //exec R
                        begin
                            pc_reset=1'b0;
                            pc_write=1'b0;
                            mem_write=1'b0;
                            ir_write=1'b0;
                            reg_write=1'b0;
                            alu_op=2'b10;               //imp
                            adr_src=1'b0;
                            result_src=2'b00;
                            ALUsrcA=2'b10;            //imp
                            ALUsrcB=2'b00;            //imp
                        end
                        s10:
                        begin
                            pc_reset=1'b0;
                            pc_write=1'b0;
                            mem_write=1'b0;
                            ir_write=1'b0;
                            reg_write=1'b1;           //imp
                            alu_op=2'b10;                
                            adr_src=1'b0;
                            result_src=2'b00;          //imp
                            ALUsrcA=2'b10;            
                            ALUsrcB=2'b00;            
                        end
                        s_error:
                        begin
                            pc_reset=1'bx;
                            pc_write=1'bx;
                            mem_write=1'bx;
                            ir_write=1'bx;
                            reg_write=1'bx;
                            alu_op=2'bxx;
                            adr_src=1'bx;
                            result_src=2'bxx;
                            ALUsrcA=2'bxx;
                            ALUsrcB=2'bxx;
//                            
                        end
                        
                    endcase
                end
endmodule
//pc_reset=1'b0;
//pc_write=1'b0;
//mem_write=1'b0;
//ir_write=1'b0;
//reg_write=1'b0;
//alu_control=5'bx;//remove later
//adr_src=1'b0;
//result_src=2'b00;
//ALUsrcA=2'b10;
//ALUsrcB=2'b01;
