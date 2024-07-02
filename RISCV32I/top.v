module top(
    clk,
    rst
);
//wires
wire[31:0] PCF, PCPlus4F;

wire[31:0] instrD, PCD, PCPlus4D;
wire[6:0] OP;
wire[2:0] funct3, funct3E;
wire[6:0] funct77;
wire funct7;
wire WE3;

endmodule
