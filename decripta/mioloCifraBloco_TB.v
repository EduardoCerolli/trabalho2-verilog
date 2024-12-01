`timescale 1ns/1ps
module mioloCifraBloco_TB ();
    reg [127:0] bloco, chave;
    wire [1279:0] chaveExpandida;
    wire [127:0] saida;
    reg [3:0] rodada;

    expandeChave ec(.chave(chave), .chaveExpandida(chaveExpandida));
    mioloCifraBloco DUT(.bloco(bloco), .chaveExpandida(chaveExpandida), .rodada(rodada), .saida(saida));

    initial begin
        chave = 128'h53414548454253454e4f53494841414e;
        bloco = 128'h2aba85402e36488d8a23ade2c79f3541;
        rodada = 4'd4;

        #10
        if (saida == 128'h6024c5dfc452a760b995af4cbdbb8aa2)
            $display("mioloCifraBloco OK");
        else
            $display("mioloCifraBloco ERRO");

    end

endmodule