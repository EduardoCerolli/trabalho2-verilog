`timescale 1ns/1ps
module cifraBloco (
    input wire [127:0] bloco, chave,
    output wire [127:0] saida
);
    wire [1279:0] chaveExpandida;
    wire [127:0] r0, r1, r2, r3, r4, r5, r6, r7, r8;
    wire [127:0] blocoXOR, saidaSB, saidaRL;

    assign blocoXOR[127:96] = bloco[127:96] ^ chave[127:96];
    assign blocoXOR[95:64] = bloco[95:64] ^   chave[95:64];
    assign blocoXOR[63:32] = bloco[63:32] ^ chave[63:32];
    assign blocoXOR[31:0] = bloco[31:0] ^ chave[31:0];

    expandeChave ec(.chave(chave), .chaveExpandida(chaveExpandida));
    
    mioloCifraBloco cb0(.bloco(blocoXOR), .chaveExpandida(chaveExpandida), .rodada(4'd0), .saida(r0));
    mioloCifraBloco cb1(.bloco(r0), .chaveExpandida(chaveExpandida), .rodada(4'd1), .saida(r1));
    mioloCifraBloco cb2(.bloco(r1), .chaveExpandida(chaveExpandida), .rodada(4'd2), .saida(r2));
    mioloCifraBloco cb3(.bloco(r2), .chaveExpandida(chaveExpandida), .rodada(4'd3), .saida(r3));
    mioloCifraBloco cb4(.bloco(r3), .chaveExpandida(chaveExpandida), .rodada(4'd4), .saida(r4));
    mioloCifraBloco cb5(.bloco(r4), .chaveExpandida(chaveExpandida), .rodada(4'd5), .saida(r5));
    mioloCifraBloco cb6(.bloco(r5), .chaveExpandida(chaveExpandida), .rodada(4'd6), .saida(r6));
    mioloCifraBloco cb7(.bloco(r6), .chaveExpandida(chaveExpandida), .rodada(4'd7), .saida(r7));
    mioloCifraBloco cb8(.bloco(r7), .chaveExpandida(chaveExpandida), .rodada(4'd8), .saida(r8));

    substituiBytes sb(.bloco(r8), .saida(saidaSB));
    rotacionaLinhas rl (.bloco(saidaSB), .saida(saidaRL));

    assign saida[127:96] = saidaRL[127:96] ^ chaveExpandida[991:960];
    assign saida[95:64] = saidaRL[95:64] ^ chaveExpandida[671:640];
    assign saida[63:32] = saidaRL[63:32] ^ chaveExpandida[351:320];
    assign saida[31:0] = saidaRL[31:0] ^ chaveExpandida[31:0];

endmodule