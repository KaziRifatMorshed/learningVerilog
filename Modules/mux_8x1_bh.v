`timescale 1ns / 1ps

// https://technobyte.org/verilog-multiplexer-8x1/

// https://medium.com/@raoumer160903/8x1-multiplexer-behavioral-implementation-in-verilog-7e6cc560dfd1#:~:text=This%20Verilog%20module%20represents%20an,the%203-bit%20select%20signal.

module mux_8x1_bh (
    output reg F, // ----------------- reg
    input [7:0] I,
    input [2:0] S
);
    always @(*)
    /*Inside the module, there’s a always block sensitive to any changes in its inputs (*). This means the block will execute whenever any of its inputs change.
    */
    begin
        case (S[0] & S[1] & S[2]) // --------------------------- 
        /*The case the statement covers all possible combinations of the 3-bit select signal (s). For each combination, it assigns the corresponding input (i) to the output (y).
        */
            3'b000:
                F = I[0];
            3'b001:
                F = I[1];
            3'b010:
                F = I[2];
            3'b011:
                F = I[3];
            3'b100:
                F = I[4];
            3'b101:
                F = I[5];
            3'b110:
                F = I[6];
            3'b111:
                F = I[7];
            // default: 
        endcase
    end
    
endmodule

module mux_8x1_str (
    output F,
    input [7:0] I,
    input [2:0] S
);
    wire [2:0] nS;
    wire [7:0] T;

    not (nS[0], S[0]), (nS[1], S[1]), (nS[2], S[2]);

    and (T[0], I[0], nS[0], nS[1], nS[2]), (T[1], I[1], S[0], nS[1], nS[2]);
    and (T[2], I[2], nS[0], S[1], nS[2]), (T[3], I[3], S[0], S[1], nS[2]);
    and (T[4], I[4], nS[0], nS[1], S[2]), (T[5], I[5], S[0], nS[1], S[2]);
    and (T[6], I[6], nS[0], S[1], S[2]), (T[7], I[7], S[0], S[1], S[2]);

    or (F, T[0], T[1], T[2], T[3], T[4], T[5], T[6], T[7]);

endmodule

