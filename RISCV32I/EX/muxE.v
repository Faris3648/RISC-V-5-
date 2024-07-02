module muxE(
    WriteDataE,
    ImmExtE,
    ALUSrcE//
    SrcBE
);
input[1:0] WriteDataE;
input[1:0] ImmExtE;
input[1:0] ALUSrcE;

output[1:0] SrcBE;

assign SrcBE = ALUSrcE ? ImmExtE : WriteDataE ; 
// ALUSrc = 1 ー＞ ImmExtE
// if not ー＞ WriteDataE.

endmodule
