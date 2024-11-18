// Kazi Rifat Morshed
// 230220

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


module TFF_with_DFF (
    output Q,
    nQ,
    input  T,
    Clk,
    rst
);
    wire _T;
    assign _T = Q ^ T;
    DFF dff (
        Q,
        nQ,
        _T,
        Clk,
        rst
    );
endmodule  // WORKS

module JK_FF (
    output reg Q,
    output nQ,
    input J,
    K,
    Clk,
    reset
);
    always @(posedge Clk or posedge reset) begin
        if (reset) Q <= 0;
        else if (J & ~K) Q <= 1'b1;
        else if (~J & K) Q <= 1'b0;
        else if (J & K) Q <= ~Q;
    end
    // always @(posedge Clk) begin
    //     case ({
    //         J, K
    //     })
    //         2'b00: Q <= Q;
    //         2'b01: Q <= 1'b0;
    //         2'b10: Q <= 1'b1;
    //         2'b11: Q <= ~Q;
    //     endcase
    //     nQ <= ~Q;
    // end
endmodule  // issue


////////////////////////////////////////////////////////////////////////////////

module Problem_5_16_DFF (
    output A,
    B,
    input  x_in,
    clock,
    reset
);
    wire D_A, D_B;
    assign D_A = (~B & ~x_in) | (A & x_in);
    assign D_B = (B & x_in) | (A & ~x_in);
    DFF FF1 (
        A,
        nA,
        D_A,
        clock,
        reset
    );
    DFF FF2 (
        B,
        nB,
        D_B,
        clock,
        reset
    );
endmodule  // DONW


module Problem_5_16_TFF (
    output A,
    B,
    input  x_in,
    clock,
    reset
);
    wire FA, FB;  // FIX HERE
    // reg A, nA, B, nB; // ---------- no need of wire nA, nB
    assign FA = ~x_in & !(A ^ B);
    assign FB = ~x_in & (A ^ B);

    // Note: I havn't considered t_reset here

    TFF_with_DFF T1 (
        A,
        nA,
        FA,  // --------- mistake here
        clock,
        reset
    );
    TFF_with_DFF T2 (
        B,
        nB,
        FB,
        clock,
        reset
    );
endmodule  // DONE

module Problem_5_16_JK (
    output A,
    B,
    input  x,
    clock,
    reset
);
    wire ja, ka, jb, kb;

    assign ja = ~B & ~x;
    assign ka = B & ~x;
    assign jb = A & ~x;
    assign kb = ~A & ~x;

    JK_FF FF_A (
        A,
        nA,
        ja,
        ka,
        clock,
        reset
    );
    JK_FF FF_B (
        B,
        nB,
        jb,
        kb,
        clock,
        reset
    );
endmodule  // ISSUE

//////////////////////////////////////////////////////////////////////

module t_Problem_5_16_n;
    reg t_x_in, t_clock, t_reset;
    wire [1:0] state;

    // Problem_5_16_TFF P (
    Problem_5_16_DFF P_DFF (
        // Problem_5_16_JK P_JK (
        FA,
        FB,
        t_x_in,
        t_clock,
        t_reset
    );
    assign state = {FA, FB};

    initial begin
        $dumpfile("t_Problem_5_16_n.vcd");
        $dumpvars(0, t_Problem_5_16_n);
    end
    initial #150 $finish;

    initial begin
        t_reset = 1;
        repeat (2) #5 t_reset = ~t_reset;
    end

    initial begin
        #0 t_clock = 0;
        // repeat (28) #5 t_clock = ~t_clock;
        forever begin
            #5 t_clock = ~t_clock;
        end
    end

    initial begin
        #0 t_x_in = 0;
        #10 t_x_in = 1;
        repeat (3) #30 t_x_in = ~t_x_in;  // 30 th sec theke 3 bar repeat korbe
    end
endmodule
