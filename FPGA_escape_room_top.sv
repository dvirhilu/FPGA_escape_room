`default_nettype none
module FPGA_escape_room_top(
    //////////// CLOCK //////////
    input           CLOCK_50,

    //////////// LED //////////
    output  [9:0]   LEDR,

    //////////// KEY //////////
    input   [3:0]   KEY,

    //////////// SW //////////
    input   [9:0]   SW,

    //////////// SEG7 //////////
    output  [6:0]   HEX0,
    output  [6:0]   HEX1,
    output  [6:0]   HEX2,
    output  [6:0]   HEX3,
    output  [6:0]   HEX4,
    output  [6:0]   HEX5,

    //////////// Audio //////////
    input           AUD_ADCDAT,
    inout           AUD_ADCLRCK,
    inout           AUD_BCLK,
    output          AUD_DACDAT,
    inout           AUD_DACLRCK,
    output          AUD_XCK,

    //////////// I2C for Audio  //////////
    output          FPGA_I2C_SCLK,
    inout           FPGA_I2C_SDAT,

    //////////// PS2 //////////
    inout           PS2_CLK,
    inout           PS2_DAT,

    //////////// GPIO //////////
    inout   [35:0]  GPIO_0,
    inout   [35:0]  GPIO_1                  
);

endmodule