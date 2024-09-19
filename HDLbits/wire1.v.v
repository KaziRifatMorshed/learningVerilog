`default_nettype none
module top_module(
    input a, b, c, d,
    output out, out_n   ); 
    // https://hdlbits.01xz.net/wiki/Wire_decl
    wire ab, cd;
    assign ab = a & b;
    assign cd = c & d;
    assign out = ab | cd;
    // assign out_n = !(ab | cd);
    // assign out_n = ~out;
    assign out_n = !out;
endmodule // done
