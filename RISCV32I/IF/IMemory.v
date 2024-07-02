module IMemory(
PCF,
IMemory_out
);
input [31:0] PCF;
output reg [31:0] IMemory_out;

reg [31:0] IMemory_value [255:0]; //max 256 instructions

initial begin
    $readmemh("memfile.mem",IMemory_value);
end

always @(*) begin
    IMemory_out = IMemory_value[PCF[31:2]];
end

// alternatively,
//assign IMemory_out = (rst == 1'b0) ? {32{1'b0}} : IMemory_value[A[31:2]];


endmodule