module BinaryAdder (
    output [3 : 0] Sum,
    output C_out,
    input [3 : 0] A, B,
    input C_in
);
    assign {C_out, Sum} = A + B + C_in;

endmodule

module t_BinaryAdder;
    // output purpose
    wire C_out;
    wire [3 : 0] S;
    // input purpose
    reg C_in;
    reg [3 : 0] A, B;

    BinaryAdder BinaryAdder (S, C_out, A, B, C_in);

    initial begin
        $dumpfile("BinaryAdder.vcd");
        $dumpvars(0, t_BinaryAdder);
        A = 4'b1011; B = 4'b0111; C_in = 1'b1;
    end
    initial #250 $finish;
    
endmodule

//// ??????????