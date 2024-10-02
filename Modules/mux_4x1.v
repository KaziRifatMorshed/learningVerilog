module mux_4x1 (
    input a, 
    input b, 
    input c, 
    input d, 
    input s0, s1,
    output out); 

         assign out = s1 ? (s0 ? d : c) : (s0 ? b : a); 

endmodule



module mux_4x1_beh ( a, b, c, d, s0, s1, out);

    input wire a, b, c, d;
    input wire s0, s1;
    output reg out;

    always @ (a or b or c or d or s0 or s1)
    begin
        case (s0 | s1)
            2'b00 : out <= a;
            2'b01 : out <= b;
            2'b10 : out <= c;
            2'b11 : out <= d;
        endcase
    end

endmodule
