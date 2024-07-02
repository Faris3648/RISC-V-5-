module PC4(
    PCF,
    PCPlus4F
);
input [31:0] PCF;
output reg [31:0] PCPlus4F;

assign PCPlus4F = PCF + 32'd4;

endmodule