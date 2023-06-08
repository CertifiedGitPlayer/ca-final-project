`timescale 1ns / 1ps
module ALU(
    input [3:0] ALU_ctl,
    input [31:0] in1, in2,
    output reg [31:0] out,
    output zero
    );
    
    always @(*) begin
      case (ALU_ctl)
        4'b0000 : out = in1 & in2;  // and
        4'b0001 : out = in1 | in2; // or
        4'b0010 : out = in1 + in2; // add
        4'b0110 : out = in1 - in2; // sub
        4'b0111 : out = in1 < in2 ? 1 : 0; // blt (branch if less than)
        4'b1000 : out = in1 >= in2 ? 1 : 0; // bge (branch if greater equal)
        // blt, bge�� zero=1�� ����� ���ؼ�
        4'b1100 : out = ~(in1 | in2); // nor
        4'b1001 : out = in1 << in2; // shift left
        4'b1010 : out = in1 >> in2; // shift right
        default : out = 32'b0;
      endcase
    end
    
    assign zero = ~|out; // (ALU_ctl == 4'b0110) <- zero�� beq, ben Ȯ�� ����
                         // (ALU_ctl == 4'b0111&1000) <-  blt, bge ==> mem stage���� zero�� branch signal�� branch ���� ������.
    
endmodule