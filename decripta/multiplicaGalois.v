module multiplicaGalois (
    input wire [7:0] e, 
    input wire [7:0] c,
    output reg [7:0] s
);

    wire [7:0] s_g1, s_g2, s_g3;

    //GF2(x)
    galois2 g1 (.e(e), .s(s_g1));

    //GF2(GF2(x))
    galois2 g2 (.e(s_g1), .s(s_g2));

    //GF2(GF2(GF2(x)))
    galois2 g3 (.e(s_g2), .s(s_g3));

    
    always @* begin
        case (c)
            // GF2(GF2(GF2(x))) ^ GF2(GF2(x)) ^ GF2(x);
            8'h0E: s = s_g3 ^ s_g2 ^ s_g1;

            // GF2(GF2(GF2(x))) ^ GF2(x) ^ x;
            8'h0B: s = s_g3 ^ s_g1 ^ e;

            // GF2(GF2(GF2(x))) ^ GF2(GF2(x)) ^ x;
            8'h0D: s = s_g3 ^ s_g2 ^ e;

            // GF2(GF2(GF2(x))) ^ x;
            8'h09: s = s_g3 ^ e;
        endcase
    end
endmodule