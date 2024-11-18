`timescale 1ns/1ps
module multiplicaColunas_TB ();
    reg [127:0] bloco;
    wire [127:0] saida;

    multiplicaColunas DUT (.bloco(bloco), .saida(saida));

    initial begin
        bloco = 128'h50564543415253494c41544641544552;
        #10

        if (saida == 128'h6e4f6e4947655a494a7a71707f41426e)
            $display("multiplicaColunas OK");
        else
            $display("multiplicaColunas ERRO");
    end

endmodule