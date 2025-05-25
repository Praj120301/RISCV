module ir #(parameter n=32)
                           (input logic clk,
                            input logic enable,
                            input logic [n-1:0]d,
                            output logic [n-1:0]q);
                            
                            logic [n-1:0]qreg,qnext;
                            
                            always_ff @(posedge clk)//async reset
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