module inverteBloco (
    input wire [127:0] bloco,
    output wire [127:0] saida
);

    assign saida[127:96] = {bloco[127:120], bloco[95:88], bloco[63:56], bloco[31:24]};
    assign saida[95:64] = {bloco[119:112], bloco[87:80], bloco[55:48], bloco[23:16]};
    assign saida[63:32] = {bloco[111:104], bloco[79:72], bloco[47:40], bloco[15:8]};
    assign saida[31:0] = {bloco[103:96], bloco[71:64], bloco[39:32], bloco[7:0]};
    
endmodule