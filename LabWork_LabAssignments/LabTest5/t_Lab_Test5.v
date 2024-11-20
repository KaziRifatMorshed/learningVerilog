module DFF (
    output reg Q,  // ------------ reg missed
    nQ,
    input D,
    Clk,
    rst
);
    always @(posedge Clk, negedge rst) begin
        if (!rst) begin
            Q  <= 1'b0;
            nQ <= 1'b1;  // ----------------- missed
        end else begin
            Q  <= D;
            nQ <= ~Q;
        end
    end
endmodule  // WORKS

module PN (
    output reg out,
    input P,
    N,
    clock,
    reset
);
wire temp ;
endmodule

// module PN (
//     output reg out,
//     input P,
//     N,
//     clock,
//     reset
// );
//     always @(posedge clock, reset) begin
//         if (reset == 0) out <= 0;
//         else if (P == 0 && N == 0) out <= 0;
//         else if (P == 0 && N == 1) out <= out;
//         else if (P == 1 && N == 0) out <= ~out;
//         else if (P == 0 && N == 0) out <= 1;
//     end
// endmodule

module Lab_Test5 (
    output FA,
    FB,
    input  t_clock,
    t_reset
);

    // wire p1, n1, p2, n2;
    // assign p1 = ;
    // assign n1 = ;
    // assign p2 = ;
    // assign n2 = ;

    PN A (
        FA,
        p1,
        n1,
        clock,
        reset
    );
    PN B (
        FB,
        p2,
        n2,
        clock,
        reset
    );

endmodule

module t_Lab_Test5;
    //reg FA, FB;
    reg t_clock, t_reset;
    wire [1:0] state;

    Lab_Test5 P (
        FA,
        FB,
        t_clock,
        t_reset
    );
    assign state = {FA, FB};

    initial begin
        $dumpfile("t_Lab_Test5.vcd");
        $dumpvars(0, t_Lab_Test5);
    end
    initial #150 $finish;

    initial begin
        t_reset = 0;
        #5 t_reset = 1;
        #5 t_reset = 0;
        t_clock = 0;
        repeat (28) #5 t_clock = ~t_clock;
    end
endmodule
