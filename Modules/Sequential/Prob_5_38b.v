module Prob_5_38b (
    input x_in,
    clock,
    reset_b
);
    parameter s0 = 2'b00, s1 = 2'b01, s2 = 2'b10, s3 = 2'b11;
    reg [1:0] state, next_state;
    always @(posedge clock, negedge reset_b)
        if (reset_b == 0) state <= s0;
        else state <= next_state;
    always @(state, x_in) begin
        next_state = s0;
        case (state)
            s0:
            if (x_in == 0) next_state = s0;
            else if (x_in == 1) next_state = s3;
            s1:
            if (x_in == 0) next_state = s1;
            else if (x_in == 1) next_state = s2;
            s2:
            if (x_in == 0) next_state = s2;
            else if (x_in == 1) next_state = s0;
            s3:
            if (x_in == 0) next_state = s3;
            else if (x_in == 1) next_state = s1;
            default: next_state = s0;
        endcase
    end
endmodule

module Prob_5_38b_structural (
    input x_in,
    clock,
    reset_b,
    output reg [1:0] state
);

    // Define the two bits A and B of the state
    wire A, B;
    assign A = state[1];
    assign B = state[0];

    // Next state wires for DA and DB
    wire DA, DB;

    // DA = A' * x + A * x'
    assign DA = (~A & x_in) | (A & ~x_in);

    // DB = A * B + B * x'
    assign DB = (A & B) | (B & ~x_in);

    // Sequential logic to update state based on DA and DB
    always @(posedge clock or negedge reset_b) begin
        if (!reset_b) state <= 2'b00;  // Reset to state s0
        else state <= {DA, DB};  // Update state with DA and DB
    end

endmodule

module FSM_DFlipFlop (
    input x_in,
    clock,
    reset_b,
    output [1:0] state
);
    // State bits A and B
    reg A, B;

    // Compute DA and DB for D flip-flops
    wire DA, DB;
    assign DA = (~A & x_in) | (A & ~x_in);
    assign DB = (A & B) | (B & ~x_in);

    // D Flip-Flop for A and B
    always @(posedge clock or negedge reset_b) begin
        if (!reset_b) begin
            A <= 0;
            B <= 0;
        end else begin
            A <= DA;
            B <= DB;
        end
    end

    assign state = {A, B};
endmodule

module FSM_JKFlipFlop (
    input x_in,
    clock,
    reset_b,
    output [1:0] state
);
    reg A, B;

    // JK inputs for flip-flops controlling A and B
    wire JA, KA, JB, KB;
    assign JA = x_in;
    assign KA = ~x_in;
    assign JB = A & x_in;
    assign KB = ~x_in;

    // JK Flip-Flop logic for A and B
    always @(posedge clock or negedge reset_b) begin
        if (!reset_b) begin
            A <= 0;
            B <= 0;
        end else begin
            // Implement JK flip-flop behavior
            if (JA && ~KA) A <= 1;
            else if (~JA && KA) A <= 0;
            else if (JA && KA) A <= ~A;

            if (JB && ~KB) B <= 1;
            else if (~JB && KB) B <= 0;
            else if (JB && KB) B <= ~B;
        end
    end

    assign state = {A, B};
endmodule


module FSM_TFlipFlop (
    input x_in,
    clock,
    reset_b,
    output [1:0] state
);
    reg A, B;  // prev state

    // T inputs for flip-flops controlling A and B
    wire TA, TB;
    assign TA = x_in;
    assign TB = A & x_in;

    // T Flip-Flop logic for A and B
    always @(posedge clock or negedge reset_b) begin
        if (!reset_b) begin
            A <= 0;
            B <= 0;
        end else begin
            // Implement T flip-flop behavior
            if (TA) A <= ~A;
            if (TB) B <= ~B;
        end
    end

    assign state = {A, B};
endmodule
