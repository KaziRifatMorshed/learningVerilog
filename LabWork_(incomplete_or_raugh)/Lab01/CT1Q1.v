module SOP (
    output FS,
    input x, y, z
);
    assign FS = y|(~x&z);
    
endmodule


module POS (
    output FP,
    input x, y, z
);
    assign FP = (!x|y)&(y|z);
    
endmodule


module t_CT1Q1;

    wire FSop, Fpop;
    reg x, y, z;
    SOP S (FSop, x, y, z);
    POS P (FPos, x, y, z);

    initial begin
        // $dumpfile("t_CT1Q1.vcd");
        $dumpfile("CT1Q1.vcd");
        $dumpvars(0, t_CT1Q1);
            x = 1'b0; y = 1'b0; z = 1'b0;    
        #10 x = 1'b0; y = 1'b0; z = 1'b1;    
        #10 x = 1'b0; y = 1'b1; z = 1'b0;    
        #10 x = 1'b0; y = 1'b1; z = 1'b1;    
        #10 x = 1'b1; y = 1'b0; z = 1'b0;    
        #10 x = 1'b1; y = 1'b0; z = 1'b1;    
        #10 x = 1'b1; y = 1'b1; z = 1'b0;    
        #10 x = 1'b1; y = 1'b1; z = 1'b1;    
    end

    // initial #150 $finish;
    
endmodule