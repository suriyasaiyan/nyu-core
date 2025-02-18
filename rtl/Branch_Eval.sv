
//Branch condition definitions
parameter NE = 2'h0; //Non branching instruction
parameter ALU = 2'h1; //Branch condition is < or !=
parameter NALU = 2'h2; //Branch condition is >= or =
parameter AL = 2'h3; //Jump instruction



module Branch_Eval #(
  WordSize = 32
)(
    input [WordSize - 1:0] alu_out,
    input [1:0] branch_cond,
    output logic act_taken
);

always_comb begin 
    case(branch_cond)
        NE: act_taken = 0;  
        ALU: act_taken = |alu_out;
        NALU: act_taken = ~(|alu_out);
        AL: act_taken = 1;
    endcase
end


endmodule
