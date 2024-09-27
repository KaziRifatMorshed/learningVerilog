module half_adder_behavioural (
    output sum, carry,
    input a, b
    // wire sum, carry;
);
    // wire sum, carry; // ???? wire jodi ekhane declare kori ????
    assign sum = a ^ b;
    assign carry = a & b;
    
endmodule

module half_adder_structural (
    output sum, carry, // আউটপুট ইনপুট যেমনে সাজাবো, তেমনেই মডিউলে প্যারামিটার পাস করব 
    input a, b
);
    xor g1 (sum, a, b);
    and g2 (carry, a, b);
endmodule

module t_half_adder;
    // reg a, b, s, c;
    // wire a, b, s, c;

    reg a, b;  // Declare a and b as reg for assignment in initial block. // ইনপুট নেওয়ার জন্য 
    wire s, c;  // s and c can remain as wires. // আউটপুট নেওয়ার জন্য 

    half_adder_structural ha_s (s, c, a, b);

    initial begin
        $dumpfile("t_half_adder.vcd");
        $dumpvars(0, t_half_adder);
        
            a = 1'b0; b = 1'b0;
        #10 a = 1'b0; b = 1'b1;
        #10 a = 1'b1; b = 1'b0;
        #10 a = 1'b1; b = 1'b1;
    end
    initial #50 $finish;
    initial $monitor ("a = ", a, ", b = ", b, ", carry = ", c, " sum = ", s);
    
endmodule
// DONE