module multiplicaColunas (
    input wire[127:0] bloco,
    output wire [127:0] saida
);
    
    // saida[0]
    assign saida[127:120] = (bloco[127:120] << 1) ^ (bloco[127] * 8'h1B) ^
                            ((bloco[95:88] << 1) ^ (bloco[95]) * 8'h1B) ^ (bloco[95:88]) ^
                            bloco[63:56] ^
                            bloco[31:24];

    // saida[1]
    assign saida[119:112] = (bloco[119:112] << 1) ^ (bloco[119] * 8'h1B) ^
                            ((bloco[87:80] << 1) ^ (bloco[87]) * 8'h1B) ^ (bloco[87:80]) ^
                            bloco[55:48] ^
                            bloco[23:16];

    // saida[2]
    assign saida[111:104] = (bloco[111:104] << 1) ^ (bloco[111] * 8'h1B) ^
                            ((bloco[79:72] << 1) ^ (bloco[79]) * 8'h1B) ^ (bloco[79:72]) ^
                            bloco[47:40] ^
                            bloco[15:8];

    // saida[3]
    assign saida[103:96] =  (bloco[103:96] << 1) ^ (bloco[103] * 8'h1B) ^
                            ((bloco[71:64] << 1) ^ (bloco[71]) * 8'h1B) ^ (bloco[71:64]) ^
                            bloco[39:32] ^
                            bloco[7:0];
    
    // saida[4]
    assign saida[95:88] =   bloco[127:120] ^
                            (bloco[95:88] << 1) ^ (bloco[95] * 8'h1B) ^
                            (bloco[63:56] << 1) ^ (bloco[63] * 8'h1B) ^ (bloco[63:56]) ^
                            bloco[31:24];

    // saida[5]
    assign saida[87:80] =   bloco[119:112] ^
                            (bloco[87:80] << 1) ^ (bloco[87] * 8'h1B) ^
                            (bloco[55:48] << 1) ^ (bloco[55] * 8'h1B) ^ (bloco[55:48]) ^
                            bloco[23:16];

    // saida[6]
    assign saida[79:72] =   bloco[111:104] ^
                            (bloco[79:72] << 1) ^ (bloco[79] * 8'h1B) ^
                            (bloco[47:40] << 1) ^ (bloco[47] * 8'h1B) ^ (bloco[47:40]) ^
                            bloco[15:8];

    // saida[7]
    assign saida[71:64] =   bloco[103:96] ^
                            (bloco[71:64] << 1) ^ (bloco[71] * 8'h1B) ^
                            (bloco[39:32] << 1) ^ (bloco[39] * 8'h1B) ^ (bloco[39:32]) ^
                            bloco[7:0];

    // saida[8]
    assign saida[63:56] =   bloco[127:120] ^
                            bloco[95:88] ^
                            (bloco[63:56] << 1) ^ (bloco[63] * 8'h1B) ^
                            (bloco[31:24] << 1) ^ (bloco[31] * 8'h1B) ^ (bloco[31:24]);

    // saida[9]
    assign saida[55:48] =   bloco[119:112] ^
                            bloco[87:80] ^
                            (bloco[55:48] << 1) ^ (bloco[55] * 8'h1B) ^
                            (bloco[23:16] << 1) ^ (bloco[23] * 8'h1B) ^ (bloco[23:16]);

    // saida[10]
    assign saida[47:40] =   bloco[111:104] ^
                            bloco[79:72] ^
                            (bloco[47:40] << 1) ^ (bloco[47] * 8'h1B) ^
                            (bloco[15:8] << 1) ^ (bloco[15] * 8'h1B) ^ (bloco[15:8]);
                            
    // saida[11]
    assign saida[39:32] =   bloco[103:96] ^
                            bloco[71:64] ^
                            (bloco[39:32] << 1) ^ (bloco[39] * 8'h1B) ^
                            (bloco[7:0] << 1) ^ (bloco[7] * 8'h1B) ^ (bloco[7:0]);

    // saida[12]
    assign saida[31:24] =   (bloco[127:120] << 1) ^ (bloco[127] * 8'h1B) ^ (bloco[127:120]) ^
                            bloco[95:88] ^
                            bloco[63:56] ^
                            (bloco[31:24] << 1) ^ (bloco[31] * 8'h1B);

    // saida[13]
    assign saida[23:16] =   (bloco[119:112] << 1) ^ (bloco[119] * 8'h1B) ^ (bloco[119:112]) ^
                            bloco[87:80] ^
                            bloco[55:48] ^
                            (bloco[23:16] << 1) ^ (bloco[23] * 8'h1B);

    // saida[14]
    assign saida[15:8] =    (bloco[111:104] << 1) ^ (bloco[111] * 8'h1B) ^ (bloco[111:104]) ^
                            bloco[79:72] ^
                            bloco[47:40] ^
                            (bloco[15:8] << 1) ^ (bloco[15] * 8'h1B);
    
    // saida[15]
    assign saida[7:0] =     (bloco[103:96] << 1) ^ (bloco[103] * 8'h1B) ^ (bloco[103:96]) ^
                            bloco[71:64] ^
                            bloco[39:32] ^
                            (bloco[7:0] << 1) ^ (bloco[7] * 8'h1B);

endmodule