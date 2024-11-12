// Kazi Rifat Morshed
// Student ID 230220
module Lab5_Assignment (
    output reg y_out,
    input x_in,
    clk,
    reset
);
    parameter s_a = 2'b00;
    parameter s_b = 2'b01;
    parameter s_c = 2'b10;
    parameter s_d = 2'b11;

    reg [1:0] state, next_state;

    always @(posedge clk)
        if (reset == 1'b0) state = s_a;
        else state <= next_state;

    always @(x_in, state) begin
        case (state)
            s_a: begin
                y_out = 1'b0;
                if (x_in == 1'b0) next_state = s_b;
                else next_state = s_c;
            end
            s_b: begin
                y_out = 1'b1;
                if (x_in == 1'b0) next_state = s_c;
                else next_state = s_d;
            end
            s_c: begin
                y_out = 1'b1;
                if (x_in == 1'b0) next_state = s_b;
                else next_state = s_d;
            end
            s_d: begin
                y_out = 1'b0;
                if (x_in == 1'b0) next_state = s_c;
                else next_state = s_a;
            end
            default: next_state = s_a;
        endcase
    end
endmodule

module t_Lab5_Assignment;
    reg x_in, clk, reset;
    wire y_out;

    initial begin
        $dumpfile("Lab5_Assignment.vcd");
        $dumpvars(0, t_Lab5_Assignment);
    end


    Lab5_Assignment Module_Beh (
        y_out,
        x_in,
        clk,
        reset
    );

    initial #400 $finish;

    initial begin
        clk = 0;
        forever begin
            #5 clk = ~clk;
        end
    end

    initial
    fork
        reset = 0;
        #30 reset = 1;
        #30 x_in = 0;

        #100 reset = 0;
        #110 reset = 1;
        #110 x_in = 1;

        #200 reset = 0;
        #210 reset = 1;
        #210 x_in = 1;
        #220 x_in = 1;

        #300 reset = 0;
        #310 reset = 1;
        #310 x_in = 1;
        #310 x_in = 0;
    join
endmodule
