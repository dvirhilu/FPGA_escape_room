module audio_i2c_master 
import type_definitions::*;
(
    input logic start, reset, clk,
    input i2c_transaction i2c_tx,
    inout logic sdat,
    output logic sclk,
);

// Writing to I2C slave is indicated by value 0, read by value 1. 
// In this case, direction is always a write.
assign i2c_tx.dir = dir_Wr;

endmodule