module cifraBloco (
    input wire [127:0] bloco,
    input wire [1279:0] chaveExpandida,
    input wire [3:0] rodada,
    output wire [127:0] saida
);
    wire [127:0] saidaSB, saidaRL, saidaMC;

    substituiBytes sb(.bloco(bloco), .saida(saidaSB));
    rotacionaLinhas rl (.bloco(saidaSB), .saida(saidaRL));
    multiplicaColunas mc (.bloco(saidaRL), .saida(saidaMC));

    assign saida[127:96] = saidaMC[127:96] ^ chaveExpandida[1279:1248];
    assign saida[95:64] = saidaMC[95:64] ^ chaveExpandida[959:928];
    assign saida[63:32] = saidaMC[63:32] ^ chaveExpandida[639:608];
    assign saida[31:0] = saidaMC[31:0] ^ chaveExpandida[319:288];

endmodule