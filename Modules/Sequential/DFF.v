module d_flip_flop (
    output reg Q,    
    output     nQ, 
    input      D,    
    input      clk   
);
    wire nD, S, R;  

    not n1 (nD, D);

    and a1 (S, D, clk); 
    and a2 (R, nD, clk);

    always @(posedge clk) begin
        Q <= S | (~R & Q);
    end

    not n2 (nQ, Q);
endmodule


// D flip-flop with asynchronous reset (V2001, V2005)
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

module t_DFF;
    wire wire_Q, wire_nQ;
    reg reg_D, reg_Clk, reg_rst;
    DFF dff (
        wire_Q,
        wire_nQ,
        reg_D,
        reg_Clk,
        reg_rst
    );

    // Output Dump File
    initial begin
        $dumpfile("DFF.vcd");
        $dumpvars(0, t_DFF);
    end

    // Clock
    initial begin
        reg_Clk <= 0;
        forever begin
            #5 reg_Clk = ~reg_Clk;
        end
    end

    initial
    fork
        #0 reg_rst = 0;
        #2 reg_rst = 1;
        #87 reg_rst = 0;
        #92 reg_rst = 1;

        #10 reg_D = 1;
        #20 reg_D = 0;
        #30 reg_D = 0;
        #40 reg_D = 1;
        #50 reg_D = 0;
        #60 reg_D = 1;
        #70 reg_D = 0;
        #80 reg_D = 0;
        #90 reg_D = 1;
        #100 reg_D = 0;
    join
    initial #250 $finish;
endmodule
