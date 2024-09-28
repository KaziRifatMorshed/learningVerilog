// 230220 Kazi Rifat Morshed

/*
Write HDL code for 3-bit Adder-Subtractor Circuit and test it with the following values 

A = 101    B = 011 Operation - Addition
A = 101    B = 011 Operation - Subtraction
A = 011    B = 101 Operation - Subtraction

A = 111    B = 000 Operation - Addition
A = 111    B = 000 Operation - Subtraction
A = 000    B = 111 Operation - Subtraction

A = 101    B = 101 Operation - Addition
A = 101    B = 101 Operation - Subtraction

*/

module HalfAdder (
    output S, C,
    input A, B
);
    xor (S, A, B);
    and (C, A, B);
endmodule 



module FullAdder (
    output S, C_out,
    input A, B, C_in
);
    wire P, G1, G2; 
    HalfAdder hf1 (P, G1, A, B);
    HalfAdder hf2 (S, G2, P, C_in);
    or g1 (C_out, G1, G2); 
endmodule 


module Adder_Subtractor_Circuit_Unit (
    output Sum, Carry,
    input A, B, prev_Carry, CTR // total 4 ta input
);
    wire xor_to_FA;

    xor g1 (xor_to_FA, B, CTR);
    // FullAdder g2 (Sum, Carry, A, xor_to_FA, CTR); // last e CTR hobe na
    FullAdder g2 (Sum, Carry, A, xor_to_FA, prev_Carry);
    
endmodule


module three_bit_Adder_Subtractor_Circuit (
    output [2:0] SUM,
    output C, V,
    input [2:0] A, B,
    input CTR
);
    wire c1, c2, c3;

    Adder_Subtractor_Circuit_Unit u0 (SUM[0], c1, A[0], B[0], CTR, CTR );
    Adder_Subtractor_Circuit_Unit u1 (SUM[1], c2, A[1], B[1], c1 , CTR );
    Adder_Subtractor_Circuit_Unit u2 (SUM[2], c3, A[2], B[2], c2 , CTR );
    
    xor jani_na_ei_gate_er_kaj_ki (V, c3, c2); // ei gate ki korche ?????
    assign C = c3; // formality
endmodule


module t_three_bit_Adder_Subtractor_Circuit;

    wire [2:0] S;
    wire C, V;
    reg [2:0] A, B;
    reg CTR;

    three_bit_Adder_Subtractor_Circuit tbASC (S, C, V, A, B, CTR);

    initial begin
        $dumpfile("three_bit_Adder_Subtractor_Circuit.vcd");
        $dumpvars(0, t_three_bit_Adder_Subtractor_Circuit);

            // A = 3'b000; B = 3'b000; CTR = 1'b0;
        #20 A = 3'b101; B = 3'b011; CTR = 1'b0;
        #20 A = 3'b101; B = 3'b011; CTR = 1'b1;
        #20 A = 3'b011; B = 3'b101; CTR = 1'b1;
        #20 A = 3'b111; B = 3'b000; CTR = 1'b0;
        #20 A = 3'b111; B = 3'b000; CTR = 1'b1;
        #20 A = 3'b000; B = 3'b111; CTR = 1'b1;
        #20 A = 3'b101; B = 3'b101; CTR = 1'b0;
        #20 A = 3'b101; B = 3'b101; CTR = 1'b1;
        
    end
	initial #220 $finish;


    initial
    $monitor("At time %t: A = %b, B = %b, CTR = %b -> SUM = %b, Carry = %b, Overflow = %b",
             $time, A, B, CTR, S, C, V);
 
    
endmodule