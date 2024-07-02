module ALU(
    SrcAE,
    SrcBE,
    ALUControlE,
    funct3E,//
    ALUResultE, //not ALUResultE since it just carries over in the end. and it ends in this stage.
    Carry,
    ZeroE
);
input [31:0] SrcAE, SrcBE;
input [4:0] ALUControlE;
input [2:0] funct3E; //?

output reg[31:0] ALUResultE;
output reg Carry, ZeroE;

reg [31:0] sum; //alu result temp
reg [32:0] tmp; //?

/////

// Detect overflow (carry-out) by adding additional zero bit at the most signf position.
// carry ー＞ set to the value of the 33rd bit of the addition result.
always @(*) begin
    tmp = {1'b0, SrcAE} + {1'b0, SrcBE};
    Carry = tmp[32];
end

// zero-flag calculation

always @(*) begin
    case(funct3E)// branch comparison
	3'b000:   ZeroE =  SrcAE == SrcBE; //beq
	3'b001:   ZeroE =  SrcAE != SrcBE; //bne
	3'b100:   ZeroE =  SrcAE < SrcBE;  //blt ... this is for signed.. maybe add @$signed?
	3'b101:   ZeroE =  SrcAE > SrcBE;  //bge ... "
	3'b110:   ZeroE =  SrcAE < SrcBE;  //bltu
	3'b111:   ZeroE =  SrcAE >= SrcBE; //bgeu
	efault : ZeroE =  0;   
    endcase
end

//
always @ (*) begin
    case(ALUControlE)
    5'b00000: sum =   SrcAE + SrcBE ;
    5'b00001: sum =   SrcAE - SrcBE ;
    5'b00010: sum =   SrcAE * SrcBE;
    5'b00011: sum =   SrcAE / SrcBE;
    5'b00100: sum =   SrcAE<< SrcBE; // shift left... maybe add [4:0] add the end to ensure only the lower 5 bits are shifted
    5'b00101: sum =   SrcAE>> SrcBE; // shift right... "
    5'b00110: sum =  {SrcAE[30:0],SrcAE[31]}; // rotate left
    5'b00111: sum =  {SrcAE[0],SrcAE[31:1]}; // rotate right
    5'b01000: sum =   SrcAE & SrcBE;
    5'b01001: sum =   SrcAE | SrcBE;
    5'b01010: sum =   SrcAE ^ SrcBE;
    5'b01011: sum = ~(SrcAE | SrcBE); // NOR
    5'b01100: sum = ~(SrcAE & SrcBE);
    5'b01101: sum = ~(SrcAE ^ SrcBE); // XNOR
    5'b01110: sum =  (SrcAE > SrcBE)  ? 32'd1 : 32'd0 ; // set if greater
    5'b01111: sum =  (SrcAE == SrcBE) ? 32'd1 : 32'd0 ; // set if equal
    5'b10000: sum =   SrcBE; //move
    default:  sum =   SrcAE + SrcBE ;
    endcase
  end

// assign result to output
always @(*) begin
    ALUResultE = sum;
end


endmodule



