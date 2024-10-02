primitive UDP_02467 (D, A, B, C);
	output D;
	input A, B, C;
	//Truth table for  f(A,B,C) = SUM (0,2,4,6,7);
	 table 
	 // A B C : D // Column header comment
		0 0 0 : 1;
		0 0 1 : 0;
		0 1 0 : 1;
		0 1 1 : 0;
		1 0 0 : 1;
		1 0 1 : 0;
		1 1 0 : 1;
		1 1 1 : 1;
	 endtable 
endprimitive

primitive UDP (D, a, b, c);
    output D;
    input a, b, c;

    table
        // inputs : output;
        0 0 0 : 1;
        0 0 1 : 0;
        0 1 0 : 1;
        0 1 1 : 0;
        1 0 0 : 1;
        1 0 1 : 0;
        1 1 0 : 1;
        1 1 1 : 1;
    endtable

endprimitive

module Circuit_with_UDP_02467 (
    output e, f,
	input a, b, c, d
);
    UDP_02467 p1(e, a, b, c);
    and (f, e, d);

endmodule

module t_Circuit_with_UDP_02467;
	wire e, f;
	reg a, b, c, d;
	Circuit_with_UDP_02467 UDP (e,f, a, b, c,d);
	and a1 (f, e, d); // Option gate instance name omitted
	initial
	begin
		$dumpfile("Primitive.vcd");
		$dumpvars(0,t_Circuit_with_UDP_02467);
		    a = 1'b0; b = 1'b0; c = 1'b0; d = 1'b0;
		#10 a = 1'b0; b = 1'b0; c = 1'b0; d = 1'b1;
		#10 a = 1'b0; b = 1'b0; c = 1'b1; d = 1'b0;
		#10 a = 1'b1; b = 1'b1; c = 1'b0; d = 1'b1;
		#10 a = 1'b1; b = 1'b1; c = 1'b1; d = 1'b1;

	end

	initial #50 $finish;
	always @ (a,b,c,d)
		 $monitor("Time = ",$time," a= %b b= %b c= %b d= %b e= %b f= %b",a,b,c,d,e,f);
endmodule