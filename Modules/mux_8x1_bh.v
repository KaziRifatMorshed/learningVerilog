`timescale 1ns / 1ps

// https://technobyte.org/verilog-multiplexer-8x1/

// https://medium.com/@raoumer160903/8x1-multiplexer-behavioral-implementation-in-verilog-7e6cc560dfd1#:~:text=This%20Verilog%20module%20represents%20an,the%203-bit%20select%20signal.

module mux_8x1_bh (
    // output reg F,
    output F,
    input [7:0] I, [2:0] S
);
    always @(*)
    /*Inside the module, there’s a always block sensitive to any changes in its inputs (*). This means the block will execute whenever any of its inputs change.
    */
    begin
        case (s)
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

