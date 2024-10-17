// prop_delay_test.v
module prop_delay_test (A, B, C, D, E);
	output D, E;
	input A, B, C;
	wire w1;

	and #(3) G1 (w1, A, B);
	not #(1) G2 (E, C);
	or #(2) G3 (D, w1, E);
endmodule

module t_prop_delay_test;
	wire D, E;
	reg A, B, C;
	prop_delay_test M1 (A, B, C, D, E); // Instance name required
	
	initial
	begin
		$dumpfile("prop_delay_test.vcd");
		$dumpvars(0,t_prop_delay_test);
		// A = 1'b0; #5 B = 1'b1; #5 C = 1'b0;
		#10 A = 1'b1; B = 1'b1; C = 1'b1;
		// এই #10 ঐখান থেকে শুরু করে লাইনের শেষ পর্যন্ত কার্যকর থাকবে 
		// যদি, এর পরে আরো কোনো ডিলে আসে, সেটা এর সাথে যোগ হবে 
		#10 A = 1'b0; B = 1'b0; C = 1'b1;
		#10 A = 1'b1; B = 1'b1; C = 1'b1;
	end
	initial #100 $finish;
	initial $monitor ("A = " , A, " , B = ", B, " , C = ", C, "|| D = ", D, " , E =", E);
endmodule
// done