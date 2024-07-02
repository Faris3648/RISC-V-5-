module MEM_WB(
    clk,
    rst,
    RegWriteM,
    ResultSrcM,
    ALUResultM,
    ReadDataM,
    RdM,
    PCPlus4M,//
    RegWriteW,
    ResultSrcW,
    ALUResultW,
    ReadDataW,
    RdW,
    PCPlus4W
);

input clk, rst;
input RegWriteM;
input [1:0] ResultSrcM;
input [31:0] ALUResultM, ReadDataM;
input [31:0] PCPlus4M; 
input [4:0] RdM;

output reg RegWriteW;
output reg [1:0] ResultSrcW;
output reg [31:0] ALUResultW, ReadDataW;
output reg [31:0] PCPlus4W;
output reg [4:0] RdW;

always @(posedge clk) begin 
    if(rst) begin
    RegWriteW <= 0;
    ResultSrcW <= 2'd0;
    ALUResultW <= 32'd0;
    ReadDataW <= 32'd0;
    RdW <= 5'd0:
    PCPlus4W <= 32'd0;
    end
    else begin
    RegWriteW <= RegWriteM;
    ResultSrcW <= ResultSrcM;
    ALUResultW <= ALUResultM;
    ReadDataW <= ReadDataM;
    RdW <= RdM;
    PCPlus4W <= PCPlus4M;
    end
end

endmodule




