module half_adder (
    input a, b;
    output sum, carry,
    wire sum, carry;
);
    wire sum, carry; // ???? wire jodi ekhane thake ????
    assign sum = a ^ b;
    assign carry = a & b;
    
endmodule
