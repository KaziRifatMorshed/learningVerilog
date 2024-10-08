module Simple_Circuit (A,B,C,D,E);
    output D,E;
    input A,B,C;
    wire w1;
    // or G1(w1, A, B);
    // not G2(E, C);
    // or G3(D, w1,E);
    or #(5) G1(w1, A, B);
    not #(2) G2(E, C);
    or #(5) G3(D, w1,E);
endmodule

module t_Simple_Circuit;
    wire D, E;
    reg A, B, C;
    Simple_Circuit M1(A, B, C, D, E);
    initial begin
        $dumpfile("Simple_Circuit.vcd");
        $dumpvars(0, t_Simple_Circuit);
        A = 1'b0; B = 1'b0; C = 1'b0;
        #50 A = 1'b1; B = 1'b1; C = 1'b1;
    end
    initial #200 $finish;
endmodule