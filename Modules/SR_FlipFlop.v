module SR_FlipFlop (
    output Q, nQ,
    input S,R,Clk);
    
    wire nand1_out, nand2_out;

    nand nand1(nand1_out, S, Clk);
    nand nand2(nand2_out, R, Clk);

    nand nand3(Q, nand1_out, nQ);
    nand nand4(nQ, nand2_out, Q);

endmodule

module t_SR_FlipFlop;
    
endmodule