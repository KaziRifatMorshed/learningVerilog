module Canonical_POS (
    output Cano_POS,
    input  x,
    y,
    z
);
    assign Cano_POS = ((~x) | y | z) & ((~x) | y | (~z)) & (x | y | z);

endmodule

module Canonical_SOP (
    output Cano_SOP,
    input  x,
    y,
    z
);
    assign Cano_SOP = (x&y&z)|(x&y&(~z))|((~x)&y&z)|((~x)&y&(~z))|((~x)&(~y)&z);

endmodule

module CT1_Q1_POS_SOP;

    wire Cano_POS, Cano_SOP;
    reg x, y, z;

    Canonical_POS P (
        Cano_POS,
        x,
        y,
        z
    );
    Canonical_SOP S (
        Cano_SOP,
        x,
        y,
        z
    );

    initial begin
        $dumpfile("CT1_Q1_POS_SOP.vcd");
        $dumpvars(0, CT1_Q1_POS_SOP);

        x = 1'b0;
        y = 1'b0;
        z = 1'b0;
        #10 x = 1'b0;
        y = 1'b0;
        z = 1'b1;
        #10 x = 1'b0;
        y = 1'b1;
        z = 1'b0;
        #10 x = 1'b0;
        y = 1'b1;
        z = 1'b1;
        #10 x = 1'b1;
        y = 1'b0;
        z = 1'b0;
        #10 x = 1'b1;
        y = 1'b0;
        z = 1'b1;
        #10 x = 1'b1;
        y = 1'b1;
        z = 1'b0;
        #10 x = 1'b1;
        y = 1'b1;
        z = 1'b1;

    end
    initial #150 $finish;

endmodule
