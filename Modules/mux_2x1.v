module mux_2x1 (
    output  F,
    // output reg F, // --------- do not use reg // but why ? // 
    // mux_2x1.v:12: error: reg F; cannot be driven by primitives or continuous assignment.
    input [1:0] I,
    input S
);
    wire nS, T1, T2;
    not(nS, S);

    // Y = D0.S’ + D1.S

    and(T1, I[0], nS), (T2, I[1], S);
    or(F, T1, T2);

endmodule // DONE

module mux_2x1_data_flow_model (
    output  F,
    input [1:0] I,
    input S
);
    assign F = (S) ? I[1] : I[0];
    
endmodule

module mux_2x1_beh_model (
    output reg F,
    input [1:0] I,
    input S
);

    /* An initial statement which is executed the only once
    *  always statement, which is executed once the sensitivity list is activated.
    */

    always @(I[0] or I[1] or S) begin
        if (S) begin
            F = I[1];
        end
        else
            F = I[0];
    end
    
endmodule

module top;
    wire out;
    reg d0, d1, s;

    mux_2x1 mux_2x1(
        .F(out),
        .I({d1, d0}),     // ----------------------- REMEMBER SYNTAX
        .S(s)
    );

    initial begin
            d0 = 1'b0; d1 = 1'b0; s = 1'b0;
        #10 d0 = 1'b0; d1 = 1'b0; s = 1'b1;
        #10 d0 = 1'b0; d1 = 1'b1; s = 1'b0;
        #10 d0 = 1'b0; d1 = 1'b1; s = 1'b1;
        #10 d0 = 1'b1; d1 = 1'b0; s = 1'b0;
        #10 d0 = 1'b1; d1 = 1'b0; s = 1'b1;
        #10 d0 = 1'b1; d1 = 1'b1; s = 1'b0;
        #10 d0 = 1'b1; d1 = 1'b1; s = 1'b1;
    end

/*
    initial
    begin
        d0 = 1'b0;
        d1 = 1'b0;
        s = 1'b0;
        #100 $finish;
    end

    // Toggle d0 every 40 time units
    always #40 d0 = ~d0;

    // Toggle d1 every 20 time units
    always #20 d1 = ~d1;

    // Toggle s (select input) every 10 time units
    always #10 s = ~s;
*/
    // Monitor the signals and display changes
    always @(d0 or d1 or s)
        $monitor("At time = %t, d0 = %b, d1 = %b, s = %b, Output = %b", $time, d0, d1, s, out);

endmodule; // DONE

/*
At time =  0, d0 = 0, d1 = 0, s = 0, Output = 0
At time = 10, d0 = 0, d1 = 0, s = 1, Output = 0
At time = 20, d0 = 0, d1 = 1, s = 0, Output = 0
At time = 30, d0 = 0, d1 = 1, s = 1, Output = 1
At time = 40, d0 = 1, d1 = 0, s = 0, Output = 1
At time = 50, d0 = 1, d1 = 0, s = 1, Output = 0
At time = 60, d0 = 1, d1 = 1, s = 0, Output = 1
At time = 70, d0 = 1, d1 = 1, s = 1, Output = 1
*/