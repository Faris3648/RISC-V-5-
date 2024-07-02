module IF_ID(
    clk,
    rst,
    StallD,
    FlushD,
    IMemory_out,
    PCF,
    PCPlus4F,//
    instrD,
    PCD,
    PCPlus4D
);
input clk, rst, StallD, FlushD;
input [31:0] IMemory_out;
input [31:0] PCF;
input [31:0] PCPlus4F;

output reg [31:0] instrD, PCD, PCPlus4D;

//////////////////////////////////////////// assign interim resister logic
// might want to change the name different to wire? idk.**

always @(posedge clk) begin
    // initialize reg @ default value, which is zero.
    if(rst) begin
        instrD <= 32'd0;
        PCD <= 32'd0;
        PCPlus4D <= 32'd0;
    end
    //do nothing if stall.
    else if (StallD) begin
        instrD <= instrD;
        PCD <= PCF;
        PCPlus4D <= PCPlus4D;
    end
    // 
    else if (FlushD) begin
        instrD <= 32'd0;
        PCD <= 32'd0;
        PCPlus4D <= 32'd0;
    end
// if rst is not active & no flush + stall → carry over the input from interim regs to output :)
    else begin
        instrD   <= IMemory_out;
        PCD      <= PCF;
        PCPlus4D <= PCPlus4F;
    end
end
endmodule



