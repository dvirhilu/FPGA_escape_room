module slow_to_fast_data_sync
    #(
        parameter data_bus_size = 5
    )
    (
        input logic slow_clk,
	    input logic fast_clk,
        input logic [data_bus_size-1:0] in_data_async,
	    output logic [data_bus_size-1:0] out_data_sync
    );
	
    /* 
    based on diagram of "Clock Skews and Clock Domains"
    lecture slides, "Moving data from slow Clk1 to faster Clk2" diagram
    */
    logic [data_bus_size-1:0] data_q1, data_q3;
    logic en_reg3;

    // the 3 registers for multi bit data
    // reg1
	always_ff @ (posedge slow_clk) 
        data_q1 <= in_data_async;
    // reg3
    always_ff @ (posedge fast_clk) 
        if (en_reg3) data_q3 <= data_q1;
    // reg2
    always_ff @ (posedge fast_clk)
        out_data_sync <= data_q3;
	
    // the 2 registers for the clocks
    synchronizer sync_instance(
        .async_sig(slow_clk),
        .clk(~fast_clk),
        .out_sync_sig(en_reg3)
    );

endmodule