module fwdmux2(
    RD2E,
    ResultW,
    ALUResultM,
    ForwardBE,//
    WriteDataE
);
input [1:0] RD2E; //1st
input [1:0] ResultW; //2nd
input [1:0] ALUResultM; //3rd
input [1:0] ForwardBE; //select signal

output[1:0] WriteDataE //output to ALU

assign WriteDataE = ForwardBE[1] ? ALUResultM : (ForwardBE[0] ? ResultW : RD2E);

endmodule
               