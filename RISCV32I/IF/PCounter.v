//combinational block with 2-1 MUX

module PCounter(
    rst,
    clk,
    PCSrcE,
    StallF,
    PCPlus4F,
    PCTargetE,
    PCF
);
//2-1 MUX1
input [31:0] PCPlus4F;
input [31:0] PCTargetE;
input [31:0] PCSrcE;
reg [31:0] PCF_; //PCF', internal wire

//PC自体
input rst, clk, StallF;
output reg [31:0] PCF;

////////////////////////////////////////////////////////////////////////////////////////

// MUX block
always @(*) begin
    PCF_ = PCSrcE ? PCTargetE : PCF + 32'd4; 
    // PCSrce = 1 → PCF_ = PCTargetE, PCSrce = 0 → PCF_ = PCPlus4F

    //if (PCSrcE)
    //PCF_ = PCTargetE;
    //else
    //PCF_ = PCPlus4F;
end

// PC Block
always @(posedge clk ) begin
    if (rst) begin //(rst == 1'b0)
        PCF <= 32'd0  //initial 0
    end

    else if(StallF) begin
        PCF <= PCF; //if stall, do nothing (no-op)
    end

    else begin
        PCF <= PCF_; // if no rst nor stall is active, PCF = PCF' 
    end
end
endmodule









