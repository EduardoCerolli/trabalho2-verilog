module galois2 (
    input wire [7:0] e,
    output wire [7:0] s
);
    
    assign s = (e[7:0] << 1) ^ (e[7] * 8'h1B);

endmodule