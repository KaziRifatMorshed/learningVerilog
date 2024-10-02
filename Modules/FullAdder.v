module half_adder_structural (
    output sum, carry, // আউটপুট ইনপুট যেমনে সাজাবো, তেমনেই মডিউলে প্যারামিটার পাস করব 
    input a, b
);
    xor g1 (sum, a, b);
    and g2 (carry, a, b);
endmodule

module full_adder_with_HA (
    output sum, carry_out,  
    input a, b, c_in
);
    wire HA_to_HA, HA1_to_OR, HA2_to_OR;

    half_adder_structural hf1 (HA_to_HA, HA1_to_OR, a, b); // need instance name
    half_adder_structural hf2 (sum, HA2_to_OR, HA_to_HA, c_in);

    or(carry_out, HA1_to_OR, HA2_to_OR);

endmodule

module full_adder_structural (
    output sum, c_out,
    input a, b, c_in
);
    wire xor1_to_xor2, xor1_to_and2, and1_to_or, and2_to_or;

    xor (xor1_to_xor2, a, b), (sum, xor1_to_xor2, c_in);
    and (and1_to_or, a, b), (and2_to_or, xor1_to_xor2, c_in);
    or (c_out, and1_to_or, and2_to_or);

endmodule
