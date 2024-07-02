module EX_MEM(
    clk,
    rst,
    WriteDataE,
    ALUResultE,
    PCPlus4E
    RdE,
    RegWriteE,
    MemWriteE,
    ResultSrcE,//
    ALUResultM,
    WriteDataM,
    PCPlus4M,
    RdM,
    RegWriteM,
    MemWriteM,
    ResultSrcM
);

input clk,rst;
input RegWriteE, MemWriteE;
input [31:0] WriteDataE, ALUResultE, PCPlus4E;
input [4:0] RdE;
input [1:0] ResultSrcE;

output reg RegWriteM, MemWriteM;
output reg [31:0] ALUResultM, WriteDataM, PCPlus4M;
output reg [4:0] RdM;
output reg [1:0] ResultSrcM;


always @(posedge clk) begin
    if (rst) begin
        RegWriteM <= 0 ;
        MemWriteM <= 0 ;
        WriteDataM <= 32'd0 ; 
        ALUResultM <= 32'd0 ;
        PCPlus4M <= 32'd0   ;
        RdM <=      5'd0    :
        ResultSrcM <= 2'b00 ;
    end
    else begin
        RegWriteM <= RegWriteE ;
        MemWriteM <= MemWriteE ;
        WriteDataM <= WriteDataE ; 
        ALUResultM <= ALUResultE;
        PCPlus4M <= PCPlus4E   ;
        RdM <=      RdE   :
        ResultSrcM <= ResultSrcE ;
    end
end

endmodule


