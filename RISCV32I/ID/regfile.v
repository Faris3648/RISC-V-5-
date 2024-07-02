module regfile(
    clk,
    rst,
    A1,
    A2,
    RdW,
    ResultW,
    RegWriteW,//
    RD1,
    RD2

);

input clk,rst;
input RegWriteW;
input [4:0] A1,A2,RdW;
input [31:0] ResultW;

output reg [31:0] RD1, RD2; 

reg[31:0] Register[31:0];
////////////////////////////////////
initial begin
    Register[0] = 32'h00000000;
end

//read data.
assign RD1 = (rst == 1'b0) ? 32'd0 : Register[A1];
assign RD2 = (rst == 1'b0) ? 32'd0 : Register[A2];

always @(posedge clk) begin
    if (RegwriteW && (RdW != 0)) begin
        Registers[RdW] <= ResultW;
    end
end

endmodule