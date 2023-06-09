`timescale 1ns / 1ps
module tb_InFetch;
   // Inputs
    reg clk, reset;
    reg PCSrc;
    reg [31:0] PCimm_in;
    // Outputs
    wire [31:0] PC_out;
    wire [31:0] instruction_out;
    
    // Insstantiate the Unit Under Test (UUT)
    InFetch uut(
        .clk(clk),
        .reset(reset),
        .PCSrc(PCSrc),
        .PCimm_in(PCimm_in),
        .instruction_out(instruction_out),
        .PC_out(PC_out)
    );
    
    initial begin
        reset = 1;
        #24 reset = 0;
    end
    
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    
    initial begin
        PCSrc = 0;
        #70 PCSrc = 1;
        #10 PCSrc = 0;
    end
    
    initial begin
        PCimm_in = 0;
        #15 PCimm_in = 44;
        #10 PCimm_in = 488;
        #10 PCimm_in = 16;
        #10 PCimm_in = 100;
        #10 PCimm_in = 64;
        #10 PCimm_in = 72;
        #10 PCimm_in = 12;
        #10 PCimm_in = 40;
        #10 PCimm_in = 56;
        #10 PCimm_in = 88;
    end
endmodule
