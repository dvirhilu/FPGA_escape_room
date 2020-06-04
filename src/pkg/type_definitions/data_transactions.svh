`ifndef type_definitions_h
`define type_definitions_h

typedef enum logic { 
    WRITE   = 0, 
    READ    = 1
} data_dir;

typedef struct {
    logic [6:0] address,
    data_dir dir,
    logic [15:0] data
} i2c_transaction;

`endif