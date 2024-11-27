module rotacionaLinhas (
    input wire[127:0] bloco,
    output wire [127:0] saida
);
    
    // Linha 0
    assign saida[127:96] = bloco[127:96];

    // Linha 1
    assign saida[95:88] = bloco[71:64];
    assign saida[87:64] = bloco[95:72];
    
    // Linha 2
    assign saida[63:48] = bloco[47:32];
    assign saida[47:32] = bloco[63:48];

    // Linha 3
    assign saida[31:8] = bloco[23:0];
    assign saida[7:0] = bloco[31:24];

endmodule