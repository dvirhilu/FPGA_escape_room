module edge_detector
    (input logic sig_in, clk,
     output logic edge_detected
    );

    logic sig_in_prev;

    always_ff @ (posedge clk)
        sig_in_prev <= sig_in;

    assign edge_detected = (sig_in) & (~sig_in_prev);

endmodule