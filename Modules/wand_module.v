module wand_module (
    input A, B, C, D,
    output z, q
);
    wand p; // module parameter e dite pari nai
    wire x, y;

    assign x = A & B;
    assign y = C | D;
    
    // and g1(x, A, B);
    // difference between these two method ?!?!?!

    // or g2(y, C, D);

    // final output
    // and g3(z, x, y);
    assign z = x & y;
    

    // wand is a special net type, it needs to be assigned to multiple drivers
    // wand() // ei nam e kono gate nai, assign korete hobe
    assign p = x;
    assign p = y;
    assign q = p;
    
    
endmodule

module t_wand;
    wire p,z;
    reg A, B, C, D;

    // module instantiation
    wand_module uut(
        .A(A), .B(B), .C(C), .D(D),
        .q(q), .z(z)
    );

    initial begin
            $dumpfile("wand_module.vcd");
            $dumpvars(0, t_wand);            
        
                A = 1'b0; B = 1'b0; C = 1'b0; D = 1'b0;
            #10 A = 1'b0; B = 1'b0; C = 1'b0; D = 1'b1;
            #10 A = 1'b0; B = 1'b0; C = 1'b1; D = 1'b0;
            #10 A = 1'b0; B = 1'b0; C = 1'b1; D = 1'b1;
            #10 A = 1'b0; B = 1'b1; C = 1'b0; D = 1'b0;
            #10 A = 1'b0; B = 1'b1; C = 1'b0; D = 1'b1;
            #10 A = 1'b0; B = 1'b1; C = 1'b1; D = 1'b0;
            #10 A = 1'b0; B = 1'b1; C = 1'b1; D = 1'b1;
            #10 A = 1'b1; B = 1'b0; C = 1'b0; D = 1'b0;
            #10 A = 1'b1; B = 1'b0; C = 1'b0; D = 1'b1;
            #10 A = 1'b1; B = 1'b0; C = 1'b1; D = 1'b0;
            #10 A = 1'b1; B = 1'b0; C = 1'b1; D = 1'b1;
            #10 A = 1'b1; B = 1'b1; C = 1'b0; D = 1'b0;
            #10 A = 1'b1; B = 1'b1; C = 1'b0; D = 1'b1;
            #10 A = 1'b1; B = 1'b1; C = 1'b1; D = 1'b0;
            #10 A = 1'b1; B = 1'b1; C = 1'b1; D = 1'b1;

    end
    initial #200 $finish;
    
endmodule