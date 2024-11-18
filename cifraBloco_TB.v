`timescale 1ns/1ps
module cifraBloco_TB ();
    reg [127:0] bloco, chave;
    wire [1279:0] chaveExpandida;
    wire [127:0] saida;
    reg [3:0] rodada;

    expandeChave ec(.chave(chave), .chaveExpandida(chaveExpandida));
    cifraBloco DUT(.bloco(bloco), .chaveExpandida(chaveExpandida), .rodada(rodada), .saida(saida));

    initial begin
        chave = 128'h53414548454253454e4f53494841414e;
        bloco = 128'h790c3faf83ba33e8a50771f995deecaf;
        rodada = 4'd5;

        #10
        $display("%h", saida);
        // if (saida == 128'h868c9847331d43f713766736d562e0f2)
        //     $display("cifraBloco OK");
        // else
        //     $display("cifraBloco ERRO");

    end

endmodule