module datmem(
    clk,
    rst,
    ALUResultM,
    WriteDataM,
    MemWriteM,//
    ReadDataM
);

input clk, rst, MemWriteM;
input [31:0] ALUResultM, WriteDataM;

output[31:0] ReadDataM;

reg[31:0] mem[255:0];

//////
initial begin
    mem[0] = 32'h00000000;
end

assign ReadDataM = (~rst) ? 32'd0 : mem[ALUResultM];

always @(posedge clk) begin
    if(MemWriteM) begin
    mem[ALUResultM] <= WriteDataM;
    end
end
endmodule



