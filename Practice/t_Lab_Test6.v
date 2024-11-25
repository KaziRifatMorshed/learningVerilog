module DFF (
    output reg Q,
    nQ,
    input D,
    Clk,
    rst
);
    // always @(posedge Clk, negedge rst) begin
    always @(posedge Clk, rst) begin
        if (!rst) begin
            Q  <= 1'b0;
            nQ <= 1'b1;
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

// module Lab_Test6_Up (
// 	// output A, B, C,
// 	output C, B, A,
// 	input clk, reset
// );
// 	wire wa, wb, wc;
// 	assign wa = B & C;
// 	assign wb = C;
// 	assign wc = 1'b1;

// 	TFF_with_DFF TA (A, nA, wa, ~clk, ~reset);
// 	TFF_with_DFF TB (B, nB, wb, ~clk, ~reset);
// 	TFF_with_DFF TC (C, nC, wc, ~clk, ~reset);

// endmodule

module Lab_Test6_Down (
    output A,
    B,
    y,
    input  x,
    clk,
    reset
);
    wire da, db, dc;
    assign da = (A & x) | (B & x);
    assign db = (A & x) | (~B & x);
    assign y  = A & x;

    DFF DA (
        A,
        nA,
        da,
        clk,
        ~reset
    );
    DFF DB (
        B,
        nB,
        db,
        clk,
        ~reset
    );
endmodule

module t_Lab_Test6;
    reg CLK;
    reg Reset;
    reg x;
    wire [1:0] A;

    Lab_Test6_Down N (
        A[1],
        A[0],
        y,
        x,
        CLK,
        Reset
    );

    initial begin
        $dumpfile("t_Lab_Test6.vcd");
        $dumpvars(0, t_Lab_Test6);
    end
    initial #170 $finish;

    initial begin
        CLK = 1'b0;
        forever begin
            #5 CLK = ~CLK;
        end
    end


    initial begin
        #5 Reset = 1'b0;
        x = 1'b1;
        #5 Reset = 1'b1;
        x = 1'b1;
        #5 Reset = 1'b0;
        x = 1'b1;
        #5 Reset = 1'b0;
        x = 1'b1;
    end
endmodule
