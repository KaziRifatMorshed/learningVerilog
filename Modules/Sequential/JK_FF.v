module jk_flip_flop (
    output Q,       
    output Qbar,    
    input J,        
    input K,        
    input clk       
);
    wire S, R, Q_int, Qbar_int;  

    and u1 (S, J, Qbar_int, clk);
    and u2 (R, K, Q_int, clk);   
    
    nor u3 (Q_int, R, Qbar_int); 
    nor u4 (Qbar_int, S, Q_int); 

    assign Q = Q_int;
    assign Qbar = Qbar_int;
endmodule


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


module t_JK_FF;
    wire Q, nQ;
    reg J, K, Clk;
    JK_FF jkff (
        Q,
        nQ,
        J,
        K,
        Clk
    );
    initial begin
        #0 Clk <= 1'b0;
        forever begin
            #5 Clk <= ~Clk;
        end
    end

    initial begin
        $dumpfile("JK_FF.vcd");
        $dumpvars(0, t_JK_FF);
    end

    initial
    fork
        #2 J = 1;
        #2 K = 0;

        #22 J = 0;
        #22 K = 1;

        #32 J = 0;
        #32 K = 0;

        #42 J = 1;
        #42 K = 1;


        #52 J = 0;
        #52 K = 0;

        #62 J = 1;
        #62 K = 1;
    join
    initial #200 $finish;
endmodule
