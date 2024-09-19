// Implicit nets are often a source of hard-to-detect bugs. In Verilog, net-type signals can be implicitly created by an assign statement or by attaching something undeclared to a module port. Implicit nets are always one-bit wires and causes bugs if you had intended to use a vector. Disabling creation of implicit nets can be done using the `default_nettype none directive.

module top_module ( 
    input wire [2:0] vec,
    output wire [2:0] outv,
    output wire o2,
    output wire o1,
    output wire o0  ); // Module body starts after module declaration
    // https://hdlbits.01xz.net/wiki/Vector0
    assign outv = vec;

    // ERROR // assign o0 = vec[2:0];  // Assigns a 3-bit vector to a 1-bit wire (incorrect)
    // ERROR // assign o1 = vec[2:1];  // Assigns a 2-bit vector to a 1-bit wire (incorrect)
    // ERROR // assign o2 = vec[2:2];  // Assigns the correct single bit from vec[2]

    // ERROR // assign {o0, o1, o2} = {vec[2:0], vec[2:1], vec[2:2]};
    // ERROR // The assignment assign {o0, o1, o2} = {vec[2:0], vec[2:1], vec[2:2]}; is trying to assign concatenated values to o0, o1, and o2

    // assign o0 = vec[0];
    // assign o1 = vec[1];
    // assign o2 = vec[2];

    assign {o0, o1, o2} = {vec[0], vec[1], vec[2]}; // correct

       

endmodule // done

// wire [7:0] w;         // 8-bit wire
// reg  [4:1] x;         // 4-bit reg
// output reg [0:0] y;   // 1-bit reg that is also an output port (this is still a vector)
// input wire [3:-2] z;  // 6-bit wire input (negative ranges are allowed)
// output [3:0] a;       // 4-bit output wire. Type is 'wire' unless specified otherwise.
// wire [0:7] b;         // 8-bit wire where b[0] is the most-significant bit.
