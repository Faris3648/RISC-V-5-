module ID_EX(
    rst,
    clk,
    PCD,
    ImmExtD,
    PCPlus4D,
    RD1,
    RD2,
    RdD,
    Rs1D,
    Rs2D,
    funct3,//? is this ALUOp?
    RegWriteD,
    ResultSrcD,
    MemWriteD,
    JumpD,
    BranchD,
    ALUControlD,
    ALUSrcD,
    FlushE,
    ZeroE,//?? why input //
    RegWriteE,
    ResultSrcE,
    MemWriteE,
    JumpE,
    BranchE,
    ALUControlE,
    ALUSrcE,
    PCSrcE,//? why output
    RD1E,
    RD2E,
    PCE,
    Rs1E,
    Rs2E,
    RdE,
    ImmExtE,
    PCPlus4E,
    funct3E,
);
input rst, clk, RegWriteD, MemWriteD, JumpD, BranchD, ALUSrcD;
input ZeroE;//!/
input FlushE;
input[31:0] PCD, ImmExtD, PCPlus4D;
input[31:0] RD1, RD2;
input[4:0] RdD,Rs1D,Rs2D;
input[4:0] ALUControlD;
input[2:0] funct3;
input[1:0] ResultSrcD;

output reg RegWriteE, MemWriteE, JumpE, BranchE, ALUSrcE;
output reg PCSrcE;//!/
output reg[31:0] ImmExtE,PCE,PCPlus4E;
output reg[31:0] RD1E, RD2E;
output reg[4:0] RdE, Rs1E, Rs2E, ALUControlE;
output reg[2:0] funct3E;
output reg[1:0] ResultSrcE;


////
    always @(posedge clk) begin
        if (rst) begin //initialize with zero
            RegWriteE   <= 0;
            MemWriteE   <= 0;
            JumpE       <= 0;
            BranchE     <= 0;
            ALUSrcE     <= 0;
            ResultSrcE  <= 2'b00;
            ALUControlE <= 5'b00000;
            PCE         <= 32'd0;
            ImmExtE     <= 32'd0;
            PCPlus4E    <= 32'd0;
            RD1E        <= 32'd0;
            RD2E        <= 32'd0;
            funct3E     <= 3'd0;
            RdE         <= 5'd0;
            Rs1E        <= 5'd0;
            Rs2E        <= 5'd0;
        end
        else if (FlushE) begin
            RegWriteE   <= 0;
            MemWriteE   <= 0;
            JumpE       <= 0;
            BranchE     <= 0;
            ALUSrcE     <= 0;
            ResultSrcE  <= 2'b00;
            ALUControlE <= 5'b00000;
            PCE         <= 32'd0;
            ImmExtE     <= 32'd0;
            PCPlus4E    <= 32'd0;
            RD1E        <= 32'd0;
            RD2E        <= 32'd0;
            funct3E     <= 3'd0;
            RdE         <= 5'd0;
            Rs1E        <= 5'd0;
            Rs2E        <= 5'd0;
        end
        else begin // if rst & flush not active, store E with D when clock begins.
            RegWriteE   <= RegWriteD;
            MemWriteE   <= MemWriteD;
            JumpE       <= JumpD;
            BranchE     <= BranchD;
            ALUSrcE     <= ALUSrcD;
            ResultSrcE  <= ResultSrcD;
            ALUControlE <= ALUControlD;
            PCE         <= PCD;
            ImmExtE     <= ImmExtD;
            PCPlus4E    <= PCPlus4D;
            RD1E        <= RD1;
            RD2E        <= RD2;
            funct3E     <= funct3;
            RdE         <= RdD;
            Rs1E        <= Rs1D;
            Rs2E        <= Rs2D;
        end

        // PCSrcE = JumpE + (ZeroE・BranchE)
        always @(*) begin
            PCSrcE = (ZeroE && BranchE) || JumpE;
        end
    end
    endmodule
