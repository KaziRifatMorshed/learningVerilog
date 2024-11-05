`include "DFF.v";

module JK_FF (
    output reg Q, output nQ,
    input J, K, Clk
);
    assign nQ = ~Q;
    always @(posedge Clk) begin
        case ({J, K})
        2'b00: Q <= Q;
        2'b01: Q <= 1'b0;
        2'b10: Q <= 1'b1;
        2'b11: Q <= ~Q;
    endcase
    end
endmodule



module t_JK_FF;
    wire Q, nQ;
    reg J, K, Clk;
    JK_FF jkff(Q, nQ,J, K, Clk);
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

    initial fork
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