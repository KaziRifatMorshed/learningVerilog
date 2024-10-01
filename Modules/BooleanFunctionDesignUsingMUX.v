`timescale 1ns / 1ps

module eight_bit_MUX_beh (
    output F,
    // input I0, I1, I2, I3, I4, I5, I6, I7, S0, S1, S2
    input [7:0] I, [2:0] S
);
    // assign F = ;
    always @(*)
    begin
        case (s)
            3'b000:F = I[0];
            3'b001:F = I[1];
            3'b010:F = I[2];
            3'b011:F = I[3];
            3'b100:F = I[4];
            3'b101:F = I[5];
            3'b110:F = I[6];
            3'b111:F = I[7];
            // default: 
        endcase
    end
    
endmodule