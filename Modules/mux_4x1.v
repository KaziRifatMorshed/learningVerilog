module mux_4x1 (
    input  a,
    input  b,
    input  c,
    input  d,
    input  s0,
    s1,
    output out
);

    assign out = s1 ? (s0 ? d : c) : (s0 ? b : a);

endmodule



module mux_4x1_beh (
    a,
    b,
    c,
    d,
    s0,
    s1,
    out
);

    input wire a, b, c, d;
    input wire s0, s1;
    output reg out;

    always @(a or b or c or d or s0 or s1) begin
        case (s0 | s1)
            2'b00: out <= a;
            2'b01: out <= b;
            2'b10: out <= c;
            2'b11: out <= d;
        endcase
    end

endmodule

module mux_4x1_struc (
    out,
    a,
    b,
    c,
    d,
    s0,
    s1
);
    output out;
    input a, b, c, d, s0, s1;
    wire s0bar, s1bar, T1, T2, T3, T4;

    not u1 (s1bar, s1);
    not u2 (s0bar, s0);
    and u3 (T1, a, s0bar, s1bar);
    and u4 (T2, b, s0, s1bar);
    and u5 (T3, c, s0bar, s1);
    and u6 (T4, d, s0, s1);
    or u7 (out, T1, T2, T3, T4);
endmodule
