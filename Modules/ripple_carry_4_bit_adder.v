module HalfAdder (
    output S, C,
    input A, B
);
    xor (S, A, B);
    and (C, A, B);
endmodule // done



module FullAdder (
    output S, C_out,
    input A, B, C_in
);
    wire P, G1, G2; // intermediate carriers
    HalfAdder hf1 (P, G1, A, B); // careful
    HalfAdder hf2 (S, G2, P, C_in); // careful
    or g1 (C_out, G1, G2); // more careful
endmodule // working



module ripple_carry_4_bit_adder (
    output [3:0] SUM,
    output C_4,
    input [3:0] A, B,
    input C_0
);
    wire C_1, C_2, C_3;

    FullAdder FA0 (SUM[0], C_1, A[0], B[0], C_0);
    FullAdder FA1 (SUM[1], C_2, A[1], B[1], C_1);
    FullAdder FA2 (SUM[2], C_3, A[2], B[2], C_2);
    FullAdder FA3 (SUM[3], C_4, A[3], B[3], C_3);
    
endmodule



module t_ripple_carry_4_bit_adder;
	wire C4;
	wire [3:0] S;
	reg [3:0] A, B;
	reg C0;
	ripple_carry_4_bit_adder RC4bA ( S, C4, A, B, C0); // Instance name required
	initial
	begin
		$dumpfile("ripple_carry_4_bit_adder.vcd");
		$dumpvars(0,t_ripple_carry_4_bit_adder);

		    A = 4'b0001; B = 4'b0111; C0 =1'b0;
		#20 A = 4'b0001; B = 4'b0001; C0 =1'b0;
        #20 A = 4'b0101; B = 4'b011; C0 = 1'b0;
        #20 A = 4'b0101; B = 4'b011; C0 = 1'b0;
        #20 A = 4'b0011; B = 4'b101; C0 = 1'b0;
        #20 A = 4'b0111; B = 4'b000; C0 = 1'b0;
        #20 A = 4'b0111; B = 4'b000; C0 = 1'b0;
        #20 A = 4'b0000; B = 4'b111; C0 = 1'b0;
        #20 A = 4'b0101; B = 4'b101; C0 = 1'b0;
        #20 A = 4'b0101; B = 4'b101; C0 = 1'b0;


	end
	initial #250 $finish;
endmodule // DONE