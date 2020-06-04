import type_definitions::*;
import constants::*;

module i2c_master # (
    input logic start, reset, clk,
    input i2c_transaction i2c_tx,
    inout logic sdat,
    output logic sclk,
    output logic busy, finish
);

// // Writing to I2C slave is indicated by value 0, read by value 1. 
// // In the case of the audio codec, direction is always a write.
// assign i2c_tx.dir = WRITE;
// assign i2c_tx.address = 7h'34;

/////////////////////////////////////////////////
// divided clock signal for i2c data rate
/////////////////////////////////////////////////

logic clk_20kHz;
parameter count_to_toggle_20kHz = 1250;
var_clk_divider_32bit i2c_clk_gen(
    .clk_in(clk),
    .count_to_toggle(count_to_toggle_20kHz),
    .clk_out(clk_20kHz)
);

/////////////////////////////////////////////////
// edge detection
/////////////////////////////////////////////////

logic clk_20kHz_sync;
// note that two ffs is sufficient since 20kHz << 50MHz
synchronizer sync_i2c_clk_to_fsm_clk(
    .async_sig(clk_20kHz),
    .clk(clk),
    .sync_sig(clk_20kHz_sync)
);

logic rising_edge_i2c_clk;
edge_detector rising_edge_detector(
    .sig_in(clk_20kHz_sync),
    .clk(clk),
    .edge_detected(rising_edge_i2c_clk)
);

logic falling_edge_i2c_clk;
edge_detector rising_edge_detector(
    .sig_in(~clk_20kHz_sync),
    .clk(clk),
    .edge_detected(falling_edge_i2c_clk)
);



endmodule