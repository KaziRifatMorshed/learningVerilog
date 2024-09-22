// Kazi Rifat Morshed // Student ID 230220
// 20 Sept 2024
/*
Write HDL code for implementing and testing the following function using
F(w, x, y, z) = wx′ + y′z′ + w′z′
    a. NOR gates only 
    b. NAND gates only
*/ // DONE

module original_implimentation ( // without simplification
    input w, x, y, z,
    output f_ORIGINAL
);

    wire a, b, c;

    and g1 (a, w, ~x);
    and g2 (b, ~y, ~z);
    and g3 (c, ~w, ~z);

    or g4 (f_ORIGINAL, a, b, c);
    
endmodule


module NOR_implementation (
    input w, x, y, z,
    output f_NOR
);

    wire w1, w2, w3, nx, ny, nz, nw, f;

    nor n1 (nw, w, w);
    nor n2 (nx, x, x);
    nor n3 (ny, y, y);
    nor n4 (nz, z, z);

    nor g1 (w1, nw, x);
    nor g2 (w2, y, z);
    nor g3 (w3, w, z);

    nor G1 (f, w1, w2, w3);
    nor G2 (f_NOR, f, f);

endmodule


module NAND_implementation (
    input w, x, y, z,
    output f_NAND
);

    wire w1, w2, w3, nw, nx, ny, nz;

    nand n1 (nw, w, w);
    nand n2 (nx, x, x);
    nand n3 (ny, y, y);
    nand n4 (nz, z, z);

    nand g1 (w1, w, nx);
    nand g2 (w2, ny, nz);
    nand g3 (w3, nw, nz);
    
    nand G (f_NAND, w1, w2, w3);
    
endmodule


module t_NOR_NAND_implementation;

    reg w, x, y, z;    
    
    NAND_implementation g_NAND_implementation (
        .w(w), .x(x), .y(y), .z(z), 
        .f_NAND(f_NAND)
    );

    NOR_implementation g_NOR_implementation (
        .w(w), .x(x), .y(y), .z(z), 
        .f_NOR(f_NOR)
    );

    original_implimentation g_original_implimentation (
        .w(w), .x(x), .y(y), .z(z), 
        .f_ORIGINAL(f_ORIGINAL)
    );

    initial begin

        $dumpfile("230220_NOR_NAND_implementation.vcd");
        $dumpvars(0, t_NOR_NAND_implementation);

            w = 1'b0; x = 1'b0; y = 1'b0; z = 1'b0;
        #10 w = 1'b0; x = 1'b0; y = 1'b0; z = 1'b1;
        #10 w = 1'b0; x = 1'b0; y = 1'b1; z = 1'b0;
        #10 w = 1'b0; x = 1'b0; y = 1'b1; z = 1'b1;
        #10 w = 1'b0; x = 1'b1; y = 1'b0; z = 1'b0;
        #10 w = 1'b0; x = 1'b1; y = 1'b0; z = 1'b1;
        #10 w = 1'b0; x = 1'b1; y = 1'b1; z = 1'b0;
        #10 w = 1'b0; x = 1'b1; y = 1'b1; z = 1'b1;
        #10 w = 1'b1; x = 1'b0; y = 1'b0; z = 1'b0;
        #10 w = 1'b1; x = 1'b0; y = 1'b0; z = 1'b1;
        #10 w = 1'b1; x = 1'b0; y = 1'b1; z = 1'b0;
        #10 w = 1'b1; x = 1'b0; y = 1'b1; z = 1'b1;
        #10 w = 1'b1; x = 1'b1; y = 1'b0; z = 1'b0;
        #10 w = 1'b1; x = 1'b1; y = 1'b0; z = 1'b1;
        #10 w = 1'b1; x = 1'b1; y = 1'b1; z = 1'b0;
        #10 w = 1'b1; x = 1'b1; y = 1'b1; z = 1'b1;

    end

    initial #200 $finish;

endmodule
