# RV32I命令セットをサポートする5段階パイプラインプロセッサ
**注意）論理合成に正しい値が出力されていないので、このプロセッサがまだ未完成の状態**

1.　パイプライン・ステージをそれぞれ以下のように分けられる：

- IF➞　PC4Adder, Program Counter, Instruction Memory, IF_ID レジスター
- ID➞ Instruction Parser (_IF_ID RegisterからのInstrDを割り当てる_） , Control Unit, Sign Extender, Register File, ID_EX レジスター
- EX➞ Forward Mux1, Forward Mux2, ALU, ALUSrc Mux, PCAdder, EX_MEM レジスター
- MEM➞ Data Memory, MEM_WB レジスター
- WB➞ Writeback Mux

2.　データハザードと制御ハザードを解決するために,HazardU.v というハザード検出ユニットを装置した。

プロセッサのマイクロアーキテクチャは以下通りです。

![image](https://github.com/Faris3648/RISC-V-5-/assets/165993479/614dd1b4-6c6a-4047-85e3-b0754e547fa5)



