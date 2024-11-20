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
    DFF dff (Q, nQ, _T, Clk, rst);
endmodule  // WORKS

module t_TFF_with_DFF;
    wire Q, nQ;
    reg t_T, Clk, t_rst;
    TFF_with_DFF e1(Q, nQ, t_T, Clk, t_rst);

    initial begin
        $dumpfile("TFF_with_DFF.vcd");
        $dumpvars(0,t_TFF_with_DFF );
    end

    initial begin #0 Clk <= 0; forever #5 Clk = ~Clk;    end

    initial fork
    	     #21 t_rst = 0;
		 #22 t_rst = 1;
		 #23 t_rst = 0;
		 #24 t_rst = 1;
		 //#66 t_rst = 1;
		 //#92 t_rst = 0;
		 #12 t_T = 1;
		 #22 t_T = 0;
		 #32 t_T = 0;
		 #42 t_T = 1;
		 #52 t_T = 0;
		 #62 t_T = 1;
		 //#70 t_D = 0;
		 //#80 t_D = 0;
		 #92 t_T = 1;
		 #102 t_T = 0;    
    join
initial #100 $finish;
    
endmodule