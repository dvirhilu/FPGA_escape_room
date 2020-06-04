module synchronizer
    (input logic async_sig,
	 input logic clk,
	 output logic out_sync_sig
    );
				
	logic intermediate_sync_sig;
	
    // single bit synchronizer
	always_ff @ (posedge clk)
        intermediate_sync_sig <= async_sig;

    always_ff @ (posedge clk)
        out_sync_sig <= intermediate_sync_sig;
	
endmodule