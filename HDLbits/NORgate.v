module top_module( 
    input a, 
    input b, 
    output out );
    // Verilog has separate bitwise-OR (|) and logical-OR (||) operators, like C. Since we're working with a one-bit here, it doesn't matter which we choose.
    assign out = !(a | b);
    // assign out = !out; 
endmodule
