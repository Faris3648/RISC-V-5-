// if possible, find a GUI for GTKWave or write via PowerShell so that it is 
// easier to execute subsequent testbenches.

// don't dump. but make if function to check_result if each command is correct or not by
// $display. all command for input funct3,ALUControl and beq, branch not equal etc.
`timescale 1ns/1ps
`include "ALU.v"
module ALU_tb();
reg [31:0] a, b;
reg [4:0] op1; 
reg [2:0] op2; // op2はbranch命令を実行

wire [31:0] result;
wire carry, zero;

//initialize ALU.v
ALU uut(
    .SrcAE(a),
    .SrcBE(b),
    .ALUControlE(op1),
    .funct3E(op2),//
    .ALUResultE(result), //not ALUResultE since it just carries over in the end. and it ends in this stage.
    .Carry(carry),
    .ZeroE(zero)
);

initial begin

//default input
a = 0;
b = 0;
op1 = 0;
op2 = 0;
#100

//add
a = 32'd10;
b = 32'd10;
op1 = 5'b00000;
#10
check_result(a+b, result);

//sub
a = 32'd10;
b = 32'd10;
op1 = 5'b00001;
#10
check_result(a-b, result);
$finish;

end

task check_result;
    input[31:0] expected;
    input [31:0] actual;
    begin
        if (expected == actual)begin
        $display ("Expected = %d, Actual = %d, correct",expected, actual);
        end else begin
        $display("Expected = %d, Actual = %d, incorrect",expected, actual);
        end
    end

endtask


endmodule


