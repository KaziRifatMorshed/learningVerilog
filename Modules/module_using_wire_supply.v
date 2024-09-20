module module_using_wire_supply (
    input A, B,
    output y
);
    supply1 vdd;
    supply0 gnd;

    wire x1, x2;

    or G1(x1, A, gnd);
    and G2(x2, B, vdd);
    xor G3(y, x1, x2);
endmodule

module t_module_using_wire_supply;

    reg A, B;  // Declare A and B as reg because they will be driven by the testbench
    wire y;

    module_using_wire_supply uut(
        .A(A), .B(B),
        .y(y)
    );
    initial begin
        $dumpfile("module_using_wire_supply.vcd");
        $dumpvars(0, t_module_using_wire_supply);

        #10 A = 1'b0; B = 1'b0;
        #10 A = 1'b0; B = 1'b1;
        #10 A = 1'b0; B = 1'b1;
        #10 A = 1'b0; B = 1'b1;
        #10 A = 1'b0; B = 1'b1;
        #10 A = 1'b1; B = 1'b0;
        #10 A = 1'b1; B = 1'b0;
        #10 A = 1'b1; B = 1'b0;
        #10 A = 1'b1; B = 1'b0;
        #10 A = 1'b1; B = 1'b1;
        #10 A = 1'b1; B = 1'b1;
        #10 A = 1'b1; B = 1'b1;
        #10 A = 1'b1; B = 1'b1;
    end
        initial #200 $finish;
    
endmodule