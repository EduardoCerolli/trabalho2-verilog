module substituiBytes (
    input wire[127:0] bloco,
    output wire [127:0] saida
);

    caixaSInv cs();

    assign saida[7:0]     = cs.caixaSInv[bloco[7:0]];
    assign saida[15:8]    = cs.caixaSInv[bloco[15:8]];
    assign saida[23:16]   = cs.caixaSInv[bloco[23:16]];
    assign saida[31:24]   = cs.caixaSInv[bloco[31:24]];
    assign saida[39:32]   = cs.caixaSInv[bloco[39:32]];
    assign saida[47:40]   = cs.caixaSInv[bloco[47:40]];
    assign saida[55:48]   = cs.caixaSInv[bloco[55:48]];
    assign saida[63:56]   = cs.caixaSInv[bloco[63:56]];
    assign saida[71:64]   = cs.caixaSInv[bloco[71:64]];
    assign saida[79:72]   = cs.caixaSInv[bloco[79:72]];
    assign saida[87:80]   = cs.caixaSInv[bloco[87:80]];
    assign saida[95:88]   = cs.caixaSInv[bloco[95:88]];
    assign saida[103:96]  = cs.caixaSInv[bloco[103:96]];
    assign saida[111:104] = cs.caixaSInv[bloco[111:104]];
    assign saida[119:112] = cs.caixaSInv[bloco[119:112]];
    assign saida[127:120] = cs.caixaSInv[bloco[127:120]];


endmodule