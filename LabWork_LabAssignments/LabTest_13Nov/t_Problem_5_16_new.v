module JK_FF (
    output reg Q,
    output nQ,
    input J,
    K,
    Clk,
    reset
);
    assign nQ = ~Q;

    always @(posedge Clk or posedge reset) begin
        if (reset) Q <= 0;
        else if (J & ~K) Q <= 1'b1;
        else if (~J & K) Q <= 1'b0;
        else if (J & K) Q <= ~Q;
    end
endmodule

module Problem_5_16_JK (
    output A,
    B,
    input  x,
    clock,
    reset
);
    wire ja, ka, jb, kb, nA, nB;

    assign ja = ~B & ~x;
    assign ka = B & ~x;
    assign jb = A & ~x;
    assign kb = ~A & ~x;

    JK_FF FF_A (
        .Q(A),
        .nQ(nA),
        .J(ja),
        .K(ka),
        .Clk(clock),
        .reset(reset)
    );

    JK_FF FF_B (
        .Q(B),
        .nQ(nB),
        .J(jb),
        .K(kb),
        .Clk(clock),
        .reset(reset)
    );
endmodule

module t_Problem_5_16_new;
    reg t_x_in, t_clock, t_reset;
    wire FA, FB;
    wire [1:0] state;

    Problem_5_16_JK P_JK (
        .A(FA),
        .B(FB),
        .x(t_x_in),
        .clock(t_clock),
        .reset(t_reset)
    );

    assign state = {FA, FB};

    initial begin
        $dumpfile("t_Problem_5_16_new.vcd");
        $dumpvars(0, t_Problem_5_16_new);
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
