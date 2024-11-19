module DFF (
    output reg Q,
    nQ,
    input D,
    clock,
    reset
);
    always @(posedge clock, negedge reset) begin
        if (reset == 0) Q <= 0;
        else Q <= D;
        nQ <= ~D;
    end
endmodule

module Prob_5_47 (
    // output reg [3:0] s, // ---------------- reg bad deoa legeche
    output [3:0] s,
    input run,
    clock,
    reset
);
    wire da, db, dc, dd;

    // নিচের লজিকে হয়ত কোনো সমস্যা আছে
    assign da = (s[0] & ~s[1]) | (s[0] & ~s[2]) | (~s[0] & s[1] & s[2]);
    assign db = s[1] ^ s[2];
    assign dc = ~s[2];
    assign dd = 4'b0000;

    DFF D1 (
        s[0],
        nA,
        da,
        clock,
        reset
    );
    DFF D2 (
        s[1],
        nB,
        db,
        clock,
        reset
    );
    DFF D3 (
        s[2],
        nC,
        dc,
        clock,
        reset
    );
    DFF D4 (
        s[3],
        nD,
        dd,
        clock,
        reset
    );
endmodule  // NOT WORKS PROPERLY

module Prob_5_47_Beh (
    output reg [3:0] state,
    input run,
    clock,
    reset
);
    always @(posedge clock, negedge reset) begin
        if (reset == 1'b0) state <= 0000;
        else if (run && state >= 4'b1110) state <= 4'b0000;
        else if (run && state < 4'b1110) state <= state + 4'b0010;
        else state <= state;
    end
endmodule  // WORKS FINE

module t_Prob_5_47_Beh;
    wire [3:0] state;
    reg run, clock, reset;

    // Prob_5_47_Beh P1 (
    Prob_5_47 P1 (
        state,
        run,
        clock,
        reset
    );

    initial begin
        $dumpfile("Prob_5_47.vcd");
        $dumpvars(0, t_Prob_5_47_Beh);
    end

    initial begin
        #0 clock = 0;
        forever begin
            #5 clock = ~clock;
        end
    end
    initial #400 $finish;

    initial
    fork
        #0 reset = 0;
        #10 reset = 1;
        #10 run = 1;  // Attempt to run is overridden by reset_b
        #30 run = 0;
        #50 run = 1;  // Initiate counting
        #70 run = 0;  // Pause
        #90 reset = 0;  // reset on-the-fly
        #120 reset = 1;  // De-assert reset_b
        #150 run = 1;  // Resume counting
        #180 run = 0;  // Pause counting
        #200 run = 1;  // Resume counting
    join

endmodule
