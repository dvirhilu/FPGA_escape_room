`ifndef ascii_chars
`define ascii_chars

// Wolfson WM8731 I2C configuration values //

// localparam left_line_in_config      = 16'b0000_000_0_1001_0111; // currently have default values
// localparam right_line_in_config     = 16'b0000_001_0_1001_0111; // currently have default values
// localparam left_hdphn_out_config    = 16'b0000_010_0_0111_1001; // currently have default values
// localparam right_hdphn_out_config   = 16'b0000_011_0_0111_1001; // currently have default values
// localparam anlg_audio_path_config   = 16'b0000_100_0_0001_0101; // uncomment to enable microphone
localparam dgtl_audio_path_config   = 16'b0000_101_0_0000_0000;
localparam power_down_config        = 16'b0000_110_0_0000_0000; // disable all power downs
localparam dgtl_audio_slave_config  = 16'b0000_111_0_0000_0010;
localparam dgtl_audio_master_config = 16'b0000_111_0_0100_0010;
localparam sampling_config          = 16'b0001_000_0_0001_1000;
localparam active_ctrl_config       = 16'b0001_001_0_0000_0001;

`endif