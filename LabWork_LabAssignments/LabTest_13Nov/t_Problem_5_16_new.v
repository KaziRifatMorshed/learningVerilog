module DFF (
    output reg Q,
    nQ,
    input D,
    Clk,
    rst
);
    always @(posedge Clk or negedge rst) begin
        if (!rst) begin
            Q  <= 1'b0;
            nQ <= 1'b1;
        end else begin
            Q  <= D;
            nQ <= ~D;
        end
    end
endmodule

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
endmodule

module Problem_5_16_n (
    output FA,
    FB,
    input  x_in,
    clock,
    reset
);
    wire A, nA, B, nB;

    assign FA = ~x_in & !(A ^ B);
    assign FB = ~x_in & (A ^ B);

    TFF_with_DFF T1 (
        A,
        nA,
        x_in,
        clock,
        reset
    );
    TFF_with_DFF T2 (
        B,
        nB,
        x_in,
        clock,
        reset
    );

    assign state = {A, B};
endmodule

module t_Problem_5_16_n;
    reg t_x_in, t_clock, t_reset;
    wire FA, FB;  // ---------------- absent in sir's code
    wire [1:0] state;

    Problem_5_16_n P (
        FA,
        FB,
        t_x_in,
        t_clock,
        t_reset
    );
    assign state = {FA, FB};

    initial begin
        $dumpfile("t_Problem_5_16_new.vcd");
        $dumpvars(0, t_Problem_5_16_n);
    end

    initial #150 $finish;

    initial begin
        t_reset = 1;
        repeat (2) #5 t_reset = ~t_reset;
    end

    initial begin
        t_clock = 0;
        repeat (28) #5 t_clock = ~t_clock;
    end

    initial begin
        t_x_in = 0;
        #10 t_x_in = 1;
        repeat (3) #30 t_x_in = ~t_x_in;
    end
endmodule
