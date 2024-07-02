module muxW(
    ALUResultW,
    ReadDataW,
    PCPlus4W,
    ResultSrcW,//
    ResultW
);

input [1:0] ALUResultW;
input [1:0] ReadDataW;
input [1:0] PCPlus4W;
input [1:0] ResultSrcW;

output [1:0] ResultW;

////////

assign ResultW = ResultSrcW[1] ? PCPlus4W : (ResultSrcW[0] ? ReadDataW : ALUResultW);

// same old 3-1 MUX function.

endmodule