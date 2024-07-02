module fwdmux1(
    RD1E,
    ResultW,
    ALUResultM,
    ForwardAE,//
    SrcAE
);
input [1:0] RD1E; //1st
input [1:0] ResultW; //2nd
input [1:0] ALUResultM; //3rd
input [1:0] ForwardAE; //select signal

output[1:0] SrcAE //output to ALU

assign SrcAE = ForwardAE[1] ? ALUResultM : (ForwardAE[0] ? ResultW : RD1E);
// FwdAE | SrcAE
// 00    | RD1E
// 01    | Resultw
// 10    | ALUResultM
// 11    | ALUResultm


endmodule
               