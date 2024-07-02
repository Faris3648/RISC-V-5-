module control(
    OP,
    funct3,
    funct7,
    funct77,//
    RegWriteD,
    ResultSrcD,
    MemWriteD,
    JumpD,
    BranchD,
    ALUControlD,
    ALUSrcD,
    ImmSrcD
);

input [6:0] OP;
input [6:0] funct77;
input [2:0] funct3;
input funct7;
output reg RegWriteD, MemWriteD, ALUSrcD, RegWriteD, BranchD, JumpD;
output reg [1:0] ResultSrcD;
output reg [4:0] ALUControlD;
output reg[2:0] ImmSrcD;

reg[1:0] ALUOp; // use or not to use


always @(*) begin
    casex(OP)
            7'b0000011: begin        //lw
                BranchD    <= 0;
                ResultSrcD <= 2'b01;
                MemWriteD  <= 0;
                ALUSrcD    <= 1;
                RegWriteD  <= 1;
                ALUOp      <= 2'b00;
                ImmSrcD    <= 3'b000;
                JumpD      <= 0;
            end 

            7'b0100011: begin  //sw
                BranchD    <= 0;
                ResultSrcD <= 2'bxx;
                MemWriteD  <= 1;
                ALUSrcD    <= 1;
                RegWriteD  <= 0;
                ALUOp      <= 2'b00;
                ImmSrcD    <= 3'b001;
                JumpD      <= 0;
            end

            7'b0110011: begin  //R-type
                BranchD    <= 0;
                ResultSrcD <= 2'b00;
                MemWriteD  <= 0;
                ALUSrcD    <= 0;
                RegWriteD  <= 1;
                ALUOp      <= 2'b10;
                ImmSrcD    <= 3'bxxx;
                JumpD      <= 0;
            end

            7'b1100011: begin  //branch
                BranchD    <= 1;
                ResultSrcD <= 2'bxx;
                MemWriteD  <= 0;
                ALUSrcD    <= 0;
                RegWriteD  <= 0;
                ALUOp      <= 2'b01;
                ImmSrcD    <= 3'b010;
                JumpD      <= 0;
            end

            7'b0010011: begin  //I-Type
                BranchD    <= 0;
                ResultSrcD <= 2'b00;
                MemWriteD  <= 0;
                ALUSrcD    <= 1;
                RegWriteD  <= 1;
                ALUOp      <= 2'b10;
                ImmSrcD    <= 3'b000;
                JumpD      <= 0;
            end
            7'b1101111: begin //j
                BranchD    <= 0;
                ResultSrcD <= 2'b10;
                MemWriteD  <= 0;
                ALUSrcD    <= 1'bx;
                RegWriteD  <= 1;
                ALUOp      <= 2'bxx;
                ImmSrcD    <= 3'b011;
                JumpD      <= 1;
            end
            default: begin
                BranchD    <= 0;
                ResultSrcD <= 2'b00;
                MemWriteD  <= 0;
                ALUSrcD    <= 1'bx;
                RegWriteD  <= 0;
                ALUOp      <= 2'b00;
                ImmSrcD    <= 3'b000;
                JumpD      <= 0;
            end 
endcase
end
endmodule
            
