module HazardU(
    Rs1D,
    Rs2D,
    Rs1E,
    Rs2E,
    RdE,
    PCSrcE,
    ResultSrcE,
    RdM,
    RegWriteM,
    RdW,
    RegWriteW,//
    StallF,
    StallD,
    FlushD,
    FlushE,
    ForwardAE,
    ForwardBE
);
//input
input [4:0] Rs1D, Rs2D;

input [4:0] Rs1E, Rs2E;
input [4:0] RdE;
input [1:0] ResultSrcE;
input PCSrcE;

input [4:0] RdM;
input RegWriteM;

input [4:0] RdW;
input RegWriteW;

//output 
output reg StallF, StallD;
output reg FlushE, FlushD;
output reg[1:0] ForwardAE, ForwardBE;

reg lwstall;


always @(*) begin
    if (((Rs1E == RdM) && RegWriteM) && (Rs1E != 0) ) begin
        ForwardAE = 2'b10;
    end
    else if ( ((Rs1E == RdW) && RegWriteW) && (Rs1E != 0) ) begin
        ForwardAE = 2'b01;
    end
    else begin
        ForwardAE = 2'b00;
    end
end


always @ (*) begin
    if (((Rs2E == RdM) && RegWriteM) && (Rs2E != 0) ) begin
        ForwardBE = 2'b10;
    end
    else if ( ((Rs2E == RdW) && RegWriteW) && (Rs2E != 0) ) begin
        ForwardBE = 2'b01;
    end
    else begin
        ForwardBE = 2'b00;
    end
end

always @ (*) begin
    lwStall = (ResultSrcE[0] & ((Rs1D == RdE) | (Rs2D == RdE)));
    StallD  = lwStall;
    FlushE  = lwStall | PCSrcE;
    StallF  = lwStall; 
    FlushD  = PCSrcE;
end

endmodule
    


