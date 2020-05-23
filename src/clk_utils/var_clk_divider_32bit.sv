/*
 * Given an input clock, the module uploads a clock with a frequency according 
 * to the following formula:
 * 
 * freq_out = (freq_in)/(2*count_to_toggle)
 *
 * where:	freq_in is the frequency of clk_in,
 * 			freq_out is the frequency of clk_out,
 * 			and count_to_toggle is a 32bit input signal
 * 
 * input clk_in:			The input clk signal who's frequnency is to be divided
 * input count_to_toggle:	The number of cycles of clk_in required before
 							toggling (complementing) the clk_out signal
 * output clk_out:			The divided clk signal
 */
module var_clk_divider_32bit (
	input logic clk_in,
	input logic [31:0] count_to_toggle,
	output logic clk_out
	);
	 
	logic toggle_flag;
	logic [31:0] counter_value;
	 
	// perform sequential actions on rising 
	always_ff@(posedge clk_in)
		// If reset is high, counter_value gets assigned 0
		if(toggle_flag) 	counter_value <= 0;
		// if reset is not high, counter_value is incremented
		// Note that using addition means counter_value resets to 0 if it reaches its max
		else				counter_value <= counter_value+1;
	
	/* clk signal should toggle as soon as the counter value is equal to 
	 * count_to_toggle. Having >= covers the edge case of switching to a lower 
	 * count_to_toggle while the counter value is already higher.
	 */
	assign toggle_flag = (counter_value >= count_to_toggle);
	
	//detect rising clk edge
	always_ff@(posedge clk_in)
		// complement the output if toggle_flag==1 on a rising edge
		if(toggle_flag) 	clk_out <= ~clk_out;
	 
endmodule