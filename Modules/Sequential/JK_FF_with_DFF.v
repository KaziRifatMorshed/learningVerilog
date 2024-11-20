module DFF (
    output reg Q,
    nQ,
    input D,
    Clk,
    rst
);
    always @(posedge Clk, negedge rst) begin
        if (!rst) begin
            Q <= 1'b0;
        end else Q <= D;
        nQ <= ~Q;
    end

endmodule

module JK_FF_with_DFF (  // Should Work..
    output Q,
    output nQ,
    input  J,
    K,
    Clk,
    rst
);
    wire _D;
    assign _D = (J & nQ) | (~K & Q);
    DFF dff (
        Q,
        nQ,
        _D,
        Clk,
        rst
    );

endmodule

module t_JK_FF_with_DFF;

    wire t_Q, t_nQ;
    reg t_J, t_K, t_Clk, t_rst;
    JK_FF_with_DFF JK (
        t_Q,
        t_nQ,
        t_J,
        t_K,
        t_Clk,
        t_rst
    );

    initial begin
        $dumpfile("JK_FF_with_DFF.vcd");
        $dumpvars(0, t_JK_FF_with_DFF);
    end

    initial begin
        t_Clk = 0;
        forever #5 t_Clk = ~t_Clk;
    end

    initial
    fork
        #0 t_rst = 0;
        #1 t_rst = 1;
        #3 t_rst = 0;
        #4 t_rst = 1;
        #87 t_rst = 0;
        #92 t_rst = 1;

        #2 t_J = 0;
        #2 t_K = 0;

        //#22 t_J = 0;
        #22 t_K = 1;

        #32 t_J = 1;
        #32 t_K = 0;

        //#42 t_J = 1;
        #42 t_K = 1;


        #52 t_J = 0;
        #52 t_K = 0;

        #62 t_J = 1;
        #62 t_K = 1;
    join

    initial #100 $finish;
endmodule
