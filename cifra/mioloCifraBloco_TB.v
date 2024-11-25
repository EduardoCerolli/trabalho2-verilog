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
        bloco = 128'h9eb32c63fdda5822a5735e9a603f2eec;
        rodada = 4'd5;

        #10
        if (saida == 128'h2500121b32570a6caba3b8d8a9fd641f)
            $display("mioloCifraBloco OK");
        else
            $display("mioloCifraBloco ERRO");

    end

endmodule