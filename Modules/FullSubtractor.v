module HalfSub (
     output s, b_out,
     input a, b
);
    xor (s, a, b);
    
    wire w1;
    not (w1, a);

    and (b_out, w1, b);
    
endmodule

module FullSub (
    output s, b_out,
    input a, b, b_in
);
    
endmodule