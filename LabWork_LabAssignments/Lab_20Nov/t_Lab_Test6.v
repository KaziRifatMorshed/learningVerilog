module DFF (
    output reg Q,  
    nQ,
    input D,
    Clk,
    rst
);
    always @(posedge Clk, negedge rst) begin
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

module Lab_Test6_Up (
	// output A, B, C,
	output C, B, A,
	input clk, reset
);
	wire wa, wb, wc;
	assign wa = B & C;
	assign wb = C;
	assign wc = 1'b1;

	TFF_with_DFF TA (A, nA, wa, ~clk, ~reset);
	TFF_with_DFF TB (B, nB, wb, ~clk, ~reset);
	TFF_with_DFF TC (C, nC, wc, ~clk, ~reset);
	
endmodule

module Lab_Test6_Down (
	output C, B, A,
	input clk, reset
);
	wire da, db, dc;
	assign da = (~A & ~B) | ( A & B & C) | (~A & B & ~C);
	assign db = ~(B ^ C);
	assign dc = C;

	DFF DA(A, nA, da, clk, ~reset);
	DFF DB(B, nB, db, clk, ~reset);
	DFF DC(C, nC, dc, clk, ~reset);	
endmodule

module t_Lab_Test6;
 	reg CLK;
	reg Reset;
	wire [2:0] A;
	wire [2:0] B;
	
	Lab_Test6_Up N (A[2], A[1], A[0], CLK, Reset);
	Lab_Test6_Down P (B[2], B[1], B[0], CLK, Reset);  
	
	initial 
		begin
			$dumpfile("t_Lab_Test6.vcd");
			$dumpvars(0, t_Lab_Test6);
		end 
	 initial #170 $finish;   
     initial
       begin
         CLK = 1'b0;
         repeat(33)
   		    #5 CLK = ~CLK; 
   	   end
	initial
	 begin
	 	#4 Reset = 1'b0;
		#4 Reset = 1'b1;
        #4 Reset = 1'b0; 
	 end
endmodule
